package entity;

import java.util.ArrayList;
import java.util.List;

public class VietnamesePhone extends Phone {

    List<Contact> contacts;

    public VietnamesePhone(){
        contacts = new ArrayList<Contact>();
    }

    @Override
    public void insertContact(String name, String phone) {
        Contact contact = new Contact(name, phone);
        contacts.add(contact);
    }

    @Override
    public void removeContact(String name) {
        contacts.removeIf(contact -> contact.getName().equals(name));
    }

    @Override
    public void updateContact(String name, String newPhone) {
        for (Contact contact: contacts) {
            if(contact.getName().equals(name)){
                contact.setPhone(newPhone);
            }
        }
    }

    @Override
    public void searchContact(String name) {
        for (Contact contact : contacts) {
            System.out.println(contact);
        }
    }

    public void printContact() {
        for (Contact contact : contacts) {
            System.out.println(contact);
        }
    }
}
