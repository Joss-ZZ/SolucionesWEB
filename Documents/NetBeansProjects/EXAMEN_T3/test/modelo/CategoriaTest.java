/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.LinkedList;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author JhoxiZZ
 */
public class CategoriaTest {
    
    public CategoriaTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of getId method, of class Categoria.
     */
    @Test
    public void testGetId() {
        System.out.println("getId");
        Categoria instance = new Categoria();
        int expResult = 0;
        int result = instance.getId();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setId method, of class Categoria.
     */
    @Test
    public void testSetId() {
        System.out.println("setId");
        int id = 0;
        Categoria instance = new Categoria();
        instance.setId(id);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getDescripcion method, of class Categoria.
     */
    @Test
    public void testGetDescripcion() {
        System.out.println("getDescripcion");
        Categoria instance = new Categoria();
        String expResult = "";
        String result = instance.getDescripcion();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of setDescripcion method, of class Categoria.
     */
    @Test
    public void testSetDescripcion() {
        System.out.println("setDescripcion");
        String descripcion = "";
        Categoria instance = new Categoria();
        instance.setDescripcion(descripcion);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of Listar method, of class Categoria.
     */
    @Test
    public void testListar() {
        System.out.println("Listar");
        int id = 0;
        String accion = "";
        Categoria instance = new Categoria();
        LinkedList<Categoria> expResult = null;
        LinkedList<Categoria> result = instance.Listar(id, accion);
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of MantenerCategoria method, of class Categoria.
     */
    @Test
    public void testMantenerCategoria() {
        System.out.println("MantenerCategoria");
        Categoria c = null;
        String accion = "";
        Categoria instance = new Categoria();
        instance.MantenerCategoria(c, accion);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of categorialista method, of class Categoria.
     */
    @Test
    public void testCategorialista() {
        System.out.println("categorialista");
        Categoria instance = new Categoria();
        LinkedList<Categoria> expResult = null;
        LinkedList<Categoria> result = instance.categorialista();
        assertEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
