package com.agiles.itson.model;


import jakarta.persistence.*;
import lombok.Data;


@Data
@Entity
@Table(name = "productos")
public class Producto {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_Producto;
    private String nombre;
    private String descripcion;
    private int precio;
    private int stock;

    @Enumerated(EnumType.STRING)
    private Estado estado;

    private enum Estado{
    ACTIVO, INACTIVO;

    }

}
