package com.marcosbarbero.demo;

import org.junit.Test;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

/**
 * @author Marcos Barbero
 */
public class PalindromeTest {

    @Test
    public void testIsPalindrome() throws Exception {
        assertTrue(Palindrome.isPalindrome("1221"));
    }

    @Test
    public void testIsNotPalindrome() throws Exception {
        assertFalse(Palindrome.isPalindrome("not palindrome"));
    }

    @Test
    public void testIsNotPalindromeNullValue() throws Exception {
        assertFalse(Palindrome.isPalindrome(null));
    }
}