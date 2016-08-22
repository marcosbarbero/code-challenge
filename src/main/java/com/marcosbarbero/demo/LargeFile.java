package com.marcosbarbero.demo;

/**
 * Given a large file that does not fit in memory (say 10GB), find the top 100000
 * most frequent phrases. The file has 50 phrases per line separated by a pipe (|).
 * Assume that the phrases do not contain pipe.
 * Example line may look like: Foobar Candy | Olympics 2012 | PGA | CNET | Microsoft Bing …
 * The above line has 5 phrases in visible region.
 *
 * @author Marcos Barbero
 */
public class LargeFile {

     /*
      * Due the time frame I was not able to complete this part of the process, anyhow, I'll try to describe how I can
      * try achieve that.
      *
      * Due the file size and the memory issue I may implement something similar to an External Sorting algorithm,
      * ref: https://en.wikipedia.org/wiki/External_sorting. Instead of read the whole file at once I may split the file
      * into smaller files in a temp dir and read them separately in a parallel process finding the most frequent phrases.
      *
      * After this process I do merge the files into an output file with the n frequent phrases.
      *
      * Something similar to this class:
      * https://github.com/marcosbarbero/external-sort/blob/master/src/main/java/com/marcosbarbero/io/ExternalSort.java
      * But instead of sorting it may count the most frequent phrases indexing with the frequency counting in some pattern
      * to be merged later.
      */

}
