module FunWithStrings
  def palindrome?
    normalized = self.downcase.gsub(/[^a-zA-Z]/, '').downcase
    normalized == normalized.reverse
  end
  def count_words
    self.strip.downcase.gsub(/[^a-zA-Z ]/, '').split(/\s+/).each_with_object(Hash.new(0)) do |word, counts|
      counts[word] += 1
    end
  end
  def anagram_groups
    candidates = self.downcase.split(/\s+/)
    #bucket all the sorted words, using the sorted version as the key
    groups = candidates.each_with_object(Hash.new{|h,k|h[k]=[]}) do |word, anagram_groups|
      key = word.chars.sort.join
      anagram_groups[key] << word
    end
    groups.values
  end
end

class String
  include FunWithStrings
end
