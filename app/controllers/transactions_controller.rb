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
      redirect_to transactions_path
    end
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

end
