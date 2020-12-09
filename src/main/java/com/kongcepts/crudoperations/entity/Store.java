package com.kongcepts.crudoperations.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "tbl_stores")
public class Store {

    @Id
    @GeneratedValue
    private int tbl_store_id;
    private String tbl_store_name;
}
