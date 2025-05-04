package test;

import services.SendMail;

public class TestEmail {
    public static void main(String[] args) {
        // Remplacez par votre email pour le test
        String destinataire = "saraharib12@gmail.com";
        String code = "123456";
        
        System.out.println("Tentative d'envoi d'email à " + destinataire);
        boolean resultat = SendMail.send(code, destinataire);
        
        if (resultat) {
            System.out.println("Email envoyé avec succès!");
        } else {
            System.out.println("Échec de l'envoi d'email.");
        }
    }
}