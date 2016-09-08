class TransactionsController < ApplicationController

  def index
    @transactions = Transaction.all
  end

  def new
    @transaction = Transaction.new
  end

  def create
    @errors = []

    # create transaction
    @transaction = Transaction.create(
      transaction_date: params[:transaction][:transaction_date],
      comment: params[:transaction][:comment]
    )

    @errors = @errors + @transaction.errors.full_messages if @transaction.errors.any?

    # create postings

    params[:postings].each do |hash|
    # binding.pry

      posting = Posting.create(
        account_id: hash[:account_id],
        transaction_id: @transaction.id,
        amount: hash[:amount]
      )
      @errors = @errors + posting.errors.full_messages if posting.errors.any?
    end

    if @errors.any?
      render :new
    else
      transaction = Transaction.find_by_id(@transaction.id)
      if @transaction.present?
        posting = Posting.where(transaction_id: "#{@transaction.id}")
        transaction.amount =  posting.sum(:amount).to_f
        transaction.save
      end
      redirect_to transactions_path
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

end
