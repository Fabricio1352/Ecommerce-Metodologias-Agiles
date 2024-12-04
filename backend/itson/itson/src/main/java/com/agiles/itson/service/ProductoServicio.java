package com.agiles.itson.service;


import com.agiles.itson.model.Producto;
import com.agiles.itson.repository.ProductoRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ProductoServicio {

    @Autowired
    ProductoRepositorio productoRepositorio;

    public List<Producto> getProductos(){
        return productoRepositorio.findAll();
    }

    public Optional<Producto> getProductos(Long id){
        return productoRepositorio.findById(id);
    }

    public void guardar(Producto producto){
        productoRepositorio.save(producto);

    }


    public void delete(Long id){
        productoRepositorio.deleteById(id);
    }

    public Producto editar(Long id, Producto productoActualizado){
        Producto productoExistente = productoRepositorio.findById(id).orElseThrow(() -> new RuntimeException("Producto no encontrado con el id " + id));

        productoExistente.setNombre(productoActualizado.getNombre());
        productoExistente.setPrecio(productoActualizado.getPrecio());
        productoExistente.setDescripcion(productoActualizado.getDescripcion());
        productoExistente.setStock(productoActualizado.getStock());
        productoExistente.setEstado(productoActualizado.getEstado());

        return productoRepositorio.save(productoExistente);

    }


}
