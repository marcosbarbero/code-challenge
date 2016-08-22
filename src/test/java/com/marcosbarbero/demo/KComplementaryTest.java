package com.marcosbarbero.demo;

import org.junit.Test;

import java.util.Set;

import static org.junit.Assert.*;

/**
 * @author Marcos Barbero
 */
public class KComplementaryTest {

    @Test
    public void testComplementaryPairs() throws Exception {
        int K = 10;
        int[] numbers = {1, 3, 7, 7, 8, 3, 2};
        Set<Pair> pairs = KComplementary.complementaryPairs(K, numbers);

        assertNotNull(pairs);
        assertEquals(pairs.size(), 4);
    }

    @Test
    public void testComplementaryPairsNullValue() throws Exception {
        Set<Pair> pairs = KComplementary.complementaryPairs(0, null);
        assertNull(pairs);
    }
}