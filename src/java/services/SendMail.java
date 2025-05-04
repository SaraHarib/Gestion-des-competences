package services;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 * Service pour l'envoi des emails
 */
public class SendMail {
    static final String USERNAME = "saraharib12@gmail.com";
    static final String PASSWORD = "odhw zbcr onfr vaqc"; // App password pour Gmail
    
    /**
     * Envoie un email avec le code de vérification
     * @param content Le code de vérification
     * @param toEmail L'adresse email du destinataire
     * @return true si l'email a été envoyé avec succès, false sinon
     */
    public static boolean send(String content, String toEmail) {
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2"); // Ajoute le protocole SSL explicite
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com"); // Fait confiance au serveur Gmail
        
        // Création de la session avec authentification
        Session session = Session.getInstance(props, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(USERNAME, PASSWORD);
            }
        });
        
        // Active le mode debug pour voir les messages SMTP
        session.setDebug(true);
        
        try {
            // Création du message
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
            message.setSubject("Code de vérification SkillBoard");
            
            // Contenu HTML pour un meilleur format
            String htmlContent = 
                "<div style='font-family: Arial, sans-serif; padding: 20px; max-width: 600px; margin: 0 auto;'>" +
                "<h2 style='color: #954a70;'>Votre code de vérification</h2>" +
                "<p>Bonjour,</p>" +
                "<p>Voici votre code de vérification pour réinitialiser votre mot de passe :</p>" +
                "<div style='background-color: #f5f5f5; padding: 15px; text-align: center; font-size: 24px; " +
                "font-weight: bold; letter-spacing: 5px; margin: 20px 0; border-radius: 8px;'>" + content + "</div>" +
                "<p>Si vous n'avez pas demandé cette réinitialisation, veuillez ignorer cet email.</p>" +
                "<p>Cordialement,<br>L'équipe SkillBoard</p>" +
                "</div>";
            
            message.setContent(htmlContent, "text/html; charset=UTF-8");
            
            // Envoi du message
            Transport.send(message);
            System.out.println("Email envoyé avec succès à " + toEmail);
            return true;
        } catch (MessagingException e) {
            System.err.println("Erreur lors de l'envoi de l'email à " + toEmail + ": " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
}