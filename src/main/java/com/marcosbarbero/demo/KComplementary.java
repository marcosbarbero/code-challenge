package com.marcosbarbero.demo;

import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;


/**
 * Write an efficient algorithm to find K-complementary pairs in a given array of
 * integers. Given Array A, pair (i, j) is K- complementary if K = A[i] + A[j];
 *
 * @author Marcos Barbero
 */
public class KComplementary {

    private static final int MIN_LENGTH = 2;

    /**
     * Find a complementary ${@link Pair} for given K and array of numbers.
     *
     * @param K       K value
     * @param numbers The numbers
     * @return A set of Pair
     */
    public static Set<Pair> complementaryPairs(int K, int[] numbers) {
        Set<Pair> pairs = null;
        if (numbers != null && numbers.length >= MIN_LENGTH) {
            pairs = new HashSet<>();
            Set<Integer> uniqueNumbers = Arrays.stream(numbers).boxed().collect(Collectors.toSet());

            List<Pair> pairList = uniqueNumbers.parallelStream()
                    .filter(number -> number < K && uniqueNumbers.contains(K - number))
                    .map(number -> new Pair(number, K - number))
                    .collect(Collectors.toList());

            pairs.addAll(pairList);
        }

        return pairs;
    }

}

/**
 * Representation of pair values of K-complementary.
 *
 * @author Marcos Barbero
 */
class Pair {
    private int firstNumber;
    private int secondNumber;

    public Pair(int firstNumber, int secondNumber) {
        this.firstNumber = firstNumber;
        this.secondNumber = secondNumber;
    }

    public int getFirstNumber() {
        return firstNumber;
    }

    public int getSecondNumber() {
        return secondNumber;
    }

    @Override
    public String toString() {
        return "Pair{" +
                "firstNumber=" + firstNumber +
                ", secondNumber=" + secondNumber +
                '}';
    }
}
