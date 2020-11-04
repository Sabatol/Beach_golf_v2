class ChargesController < ApplicationController
  def new
    @event = Event.find_by(id: params[:event_id])
    @price = @event.price
    unless Participation.find_by(user_id: current_user.id, event_id: @event.id) == nil
      flash[:alert] = "Vous avez déjà souscris une participation à l'évènement !" #Ne fonctionne pas
      redirect_to event_path(@event.id)
    end
  end
  
  def create
    # Amount in cents
    @event = Event.find_by(id: params[:event_id])
    @price = @event.price
    amount = @price*100
  
    
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
      charge = Stripe::Charge.create({
      customer: customer.id,
      amount: amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })
  
    if customer.save && charge.save
      Participation.create(user_id: current_user.id, event_id: @event.id, stripe_customer_id: customer.id)
      redirect_to event_path(@event.id)
    else
      render 'new'
    end
  
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
