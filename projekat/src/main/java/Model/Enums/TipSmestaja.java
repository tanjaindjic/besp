package Model.Enums;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class TipSmestaja {

    @Id
    @GeneratedValue
    private Long id;

    private String tip;

}
