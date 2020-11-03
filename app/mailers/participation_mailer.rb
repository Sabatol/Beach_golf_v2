class ParticipationMailer < ApplicationMailer
  default from: 'machin@yopmail.com'
 
  def participation_email(participation)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @participation = participation
    @user = @participation.user 
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @participation.event.user.email, subject: 'Bienvenue chez Beach-Golf-France !') 
  end
end
