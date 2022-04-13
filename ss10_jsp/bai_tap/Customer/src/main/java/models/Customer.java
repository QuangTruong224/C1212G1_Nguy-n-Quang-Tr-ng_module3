package models;

public class Customer {
    private String name;
    private String dateOfBirth;
    private String dress;
    private String image;

    public Customer() {
    }

    public Customer(String name, String dateOfBirth, String dress, String image) {
        this.name = name;
        this.dateOfBirth = dateOfBirth;
        this.dress = dress;
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getDress() {
        return dress;
    }

    public void setDress(String dress) {
        this.dress = dress;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
}

