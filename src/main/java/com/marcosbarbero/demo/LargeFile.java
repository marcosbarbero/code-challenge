4package com.marcosbarbero.demo;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.stream.Collectors;
import java.util.stream.Stream;

/**
 * Given a large file that does not fit in memory (say 10GB), find the top 100000 most frequent phrases. The file has 50
 * phrases per line separated by a pipe (|). Assume that the phrases do not contain pipe. Example line may look like:
 * Foobar Candy | Olympics 2012 | PGA | CNET | Microsoft Bing … The above line has 5 phrases in visible region.
 *
 * @author Marcos Barbero
 */
public class LargeFile {

    private static final String DELIMITER = "\\|";

    private LargeFile() {
    }

    public static List<Entry<String, Long>> findTopFrequentPhrasesFromFile(String filePath, long top)
            throws IOException {

        Map<String, Long> phraseCountMap = new HashMap<>();
        try (Stream<String> lines = Files.lines(Paths.get(filePath))) {
            lines.map(line -> line.split(DELIMITER)).forEach(phraseArr -> countPhrases(phraseArr, phraseCountMap));
        }

        return phraseCountMap.entrySet().stream()
                .sorted((entry1, entry2) -> entry2.getValue().compareTo(entry1.getValue()))
                .limit(top).collect(Collectors.toList());
    }

    private static void countPhrases(String[] phraseArr, Map<String, Long> phraseCountMap) {
        for (String phrase : phraseArr) {
            if (phrase.isEmpty()) {
                return;
            }

            Long count = phraseCountMap.getOrDefault(phrase, 0L);
            phraseCountMap.put(phrase, ++count);
        }
    }
}
