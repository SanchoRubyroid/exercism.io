module BookKeeping
  VERSION = 4
end

class Complement
  TRANSCRIPTION = {
    'G' => 'C',
    'C' => 'G',
    'T' => 'A',
    'A' => 'U'
  }

  def self.of_dna(dna)
    rna = String.new
    dna.each_char do |dna_strand|
      rna_strand = TRANSCRIPTION[dna_strand]

      rna = String.new and break unless rna_strand
      rna << rna_strand
    end

    rna
  end
end