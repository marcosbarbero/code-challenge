package com.marcosbarbero.demo;

import java.io.IOException;
import java.util.List;
import java.util.Map.Entry;
import org.junit.Assert;
import org.junit.Test;

/**
 * @author Ali Tasci
 */
public class LargeFileTest {

    @Test
    public void findTopFrequentPhrasesFromFile() throws IOException {
        List<Entry<String, Long>> topFrequentPhrases = LargeFile
                .findTopFrequentPhrasesFromFile("src/test/file.txt", 20);

        Assert.assertEquals(20, topFrequentPhrases.size());
        Assert.assertEquals(12, (long) topFrequentPhrases.get(0).getValue());
    }
}
