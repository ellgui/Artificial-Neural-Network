clear all
clc
populationSize = 100;
numberOfGenes = 50;
crossoverProbability = 0.8;
%mutationProbability = 0.025;
tournamentSelectionParameter = 0.75;
variableRange = 10.0;
copiesOfBestIndividual = 1; %copies of the best individual 
numberOfGenerations = 100;
numberVariables= 2;
tournamentSize = 2;
nrCopiesOfBestIndividuals=1;
mutationProbability = [0.00, 0.02, 0.05, 0.10];
fitness = zeros(populationSize,1);
numberOfRuns=100;%

 
for m=1:length(mutationProbability) %
    
for k=1:numberOfRuns%
fitness = zeros(populationSize,1);%
population = InitializePopulation(populationSize, numberOfGenes);

for iGeneration=1:numberOfGenerations;
    
    maximumFitness(k) = 0.0; %non-neg fitness values (ta bort (k))
    xBest = zeros(1,2); %[0.0]
    bestIndividualIndex = 0;

for i = 1:populationSize
    chromosome = population(i,:); %vector containing all elements on row i of the matrix population
    x = DecodeChromosome(chromosome,numberVariables,variableRange);
    decodedPopulation(i,:) = x;
    fitness(i) = EvaluateIndividual(x);
    if (fitness(i) > maximumFitness(k))
        maximumFitness(k) = fitness(i);
        bestIndividualIndex = i;
        xBest = x;
    end
end

tempPopulation = population;

for i = 1:2:populationSize
    i1 = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
    i2 = TournamentSelect(fitness,tournamentSelectionParameter,tournamentSize);
    chromosome1 = population(i1,:);
    chromosome2 = population(i2,:);
   
    
r = rand;
if (r < crossoverProbability)
    newChromosomePair = Cross(chromosome1,chromosome2);
    tempPopulation(i,:) = newChromosomePair(1,:);
    tempPopulation(i+1,:) = newChromosomePair(2,:);
else
   tempPopulation(i,:) = chromosome1;
   tempPopulation(i+1,:) = chromosome2;
end
end


for i = 1:populationSize
    originalChromosome = tempPopulation(i,:);
    mutatedChromosome = Mutate(originalChromosome,mutationProbability(m)); %ändra till mutprob
    tempPopulation(i,:) = mutatedChromosome;
end

bestIndividual=population(bestIndividualIndex,:);
population = InsertBestIndividual(tempPopulation, bestIndividual, nrCopiesOfBestIndividuals);

end %loop over generations
end

medianMaximumFitness(m) = median(maximumFitness(m));

format long;
% disp('Best individual');
% disp(xBest);
disp('MutationRate');
disp(mutationProbability(m));
disp('MedianOfFitness');
disp(median(maximumFitness(m)));
end


T=table(mutationProbability', medianMaximumFitness','VariableNames',{'MutationRate';'MedianOfFitness'});

disp(T)

