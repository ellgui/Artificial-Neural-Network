function randPatterns=GeneratePatterns(numberBits,numberPatterns)
randPatterns=rand(numberBits,numberPatterns);
randPatterns=sign(randPatterns-0.5*ones(numberBits,numberPatterns));

end

