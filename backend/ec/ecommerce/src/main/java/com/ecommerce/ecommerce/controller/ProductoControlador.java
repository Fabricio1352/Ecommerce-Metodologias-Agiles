package com.ecommerce.ecommerce.controller;


import com.ecommerce.ecommerce.model.Producto;
import com.ecommerce.ecommerce.service.ProductoServicio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping(path = "api/v1/producto")
public class ProductoControlador {

    @Autowired
   private  ProductoServicio productoServicio;


    /**
     * Metodo para obtener TODOS los productos
     *
     * endpoint para CLIENTE
     *
     * @return
     */
    @GetMapping
    public List<Producto> obtenerProductos(){

        return productoServicio.getProductos();
    }


    /**
     * Metodo para obtener UN SOLO producto
     * endpoint para CLIENTE
     *
     * @param idProducto
     * @return
     */
    @GetMapping("/{idProducto}")
    public Optional<Producto> obtenerProducto(@PathVariable("idProducto") Long idProducto){

        return productoServicio.getProductos(idProducto);

    }


    /**
     * Metodo para guardar UN SOLO producto
     *
     * endpoint para ADMIN
     *
     * @param producto
     */
    @PostMapping
    public void guardarProductos(@RequestBody Producto producto){

       productoServicio.guardar(producto);
    }

    /**
     * Metodo para eliminar UN SOLO producto
     *
     * endpoint para ADMIN
     *
     * @param idProducto
     */
    @DeleteMapping("/{idProducto}")
    public void eliminarProducto(@PathVariable("idProducto") Long idProducto){
        productoServicio.delete(idProducto);
    }

    @PutMapping("/{id}")
    public void editarProducto(@PathVariable Long id, @RequestBody Producto producto){


        Producto productoEditado = productoServicio.editar(id,producto);


    }




}
