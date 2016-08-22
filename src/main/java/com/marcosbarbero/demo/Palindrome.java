package com.marcosbarbero.demo;

/**
 * Write an efficient algorithm to check if a string is a palindrome.
 * A string is a palindrome if the string matches the reverse of string.
 * Example: 1221 is a palindrome but not 1121.
 *
 * @author Marcos Barbero
 */
public class Palindrome {

    public static boolean isPalindrome(String input) {
        boolean result = input != null;
        if (result) {
            input = input.toLowerCase();
            int left = 0;
            int right = input.length() - 1;
            while (left < right) {
                if (input.charAt(left++) != input.charAt(right--)) {
                    result = false;
                    break;
                }
            }
        }
        return result;
    }

}
