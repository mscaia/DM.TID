# Question 1
# Création d'une matrice des effectifs
effectifs <- matrix(c(
  27.8, 70.0, 119.6, 187.1, 76.9,  # Femmes - Agriculteurs
  117.4,  357.9, 556.1, 525.8, 184.8,  # Femmes - Artisans
  564.9,  1209.0, 1429.5, 1161.6, 360.0,  # Femmes - Cadres
  1353.7,  1840.7, 1895.0, 1507.8, 256.2,  # Femmes - Professions intermédiaires
  1570.9,  1605.6, 1880.9, 1819.6, 397.0,  # Femmes - Employés
  1271.6,  1285.9, 1362.7, 1300.4, 180.5,  # Femmes - Ouvriers
  24.2,  56.2, 89.8, 138.0, 43.4,  # Hommes - Agriculteurs
  79.2,  258.4, 387.2, 378.7, 128.7,  # Hommes - Artisans
  315.7,  685.3, 853.2, 719.0, 240.1,  # Hommes - Cadres
  613.3,  834.7, 915.7, 755.9, 123.7,  # Hommes - Professions intermédiaires
  476.0,  449.5, 416.0, 329.8, 58.3,  # Hommes - Employés
  1085.8,  1068.4, 1065.5, 987.9, 130.1  # Hommes - Ouvriers
), nrow = 12, byrow = TRUE)

# Noms des colonnes (groupes d age)
colnames(effectifs) <- c("15-29","30-39", "40-49", "50-59", "60+")

# Noms des lignes (combinaison sexe et catégorie socioprofessionnelle)
rownames(effectifs) <- c("Femmes_Agriculteurs", "Femmes_Artisans", "Femmes_Cadres", 
                         "Femmes_Professions_inter", "Femmes_Employes", "Femmes_Ouvriers",
                         "Hommes_Agriculteurs", "Hommes_Artisans", "Hommes_Cadres", 
                         "Hommes_Professions_inter", "Hommes_Employes", "Hommes_Ouvriers")


tableau <- effectifs/sum(effectifs)  # On met notre tableau sous forme de pourcentages

#On calcule H(A)
age_effectif <- colSums(tableau)
H.A = 0
for(i in 1:length(age_effectif)){
  H.A <- H.A + (-age_effectif[i]*log2(age_effectif[i]))
}
H.A <- as.numeric(H.A)
#On calcule H(S)
femmes_effectif <- sum(rowSums(tableau[1:6,]))
hommes_effectif <- sum(rowSums(tableau[7:12,]))
sexe_effectif <- c(femmes_effectif, hommes_effectif)
H.S = 0
for(i in 1:length(sexe_effectif)){
  H.S <- H.S + (-sexe_effectif[i]*log2(sexe_effectif[i]))
}
#On calcule H(C)
# Calcul de la somme des effectifs pour chaque catégorie socioprofessionnelle
categorie_effectif <- list(
  Agriculteurs = sum(rowSums(tableau[c(1, 7), ])),       # Agriculteurs (Femmes + Hommes)
  Artisans = sum(rowSums(tableau[c(2, 8), ])),           # Artisans (Femmes + Hommes)
  Cadres = sum(rowSums(tableau[c(3, 9), ])),             # Cadres (Femmes + Hommes)
  Professions_inter = sum(rowSums(tableau[c(4, 10), ])), # Professions intermédiaires (Femmes + Hommes)
  Employes = sum(rowSums(tableau[c(5, 11), ])),          # Employés (Femmes + Hommes)
  Ouvriers = sum(rowSums(tableau[c(6, 12), ]))           # Ouvriers (Femmes + Hommes)
)
H.C = 0
for(i in 1:length(categorie_effectif)){
  H.C <- H.C + (-categorie_effectif[[i]]*log2(categorie_effectif[[i]]))
}
#Nous venons de calculer les entropies de chaque variable.

# Calculons les entropies H(A,S), H(A,C) et H(S,C)
# Pour H(A,S)
age_femme <- colSums(tableau[1:6,])
age_homme <- colSums(tableau[7:12,])
age_sexe <- c(age_femme, age_homme)
H.A.S = 0
for(i in 1:length(age_sexe)){
  H.A.S <- H.A.S + (-age_sexe[i]*log2(age_sexe[i]))
}
H.A.S <- as.numeric(H.A.S)
# Pour H(A,C)
Agriculteurs_age = colSums(tableau[c(1, 7), ])       
Artisans_age = colSums(tableau[c(2, 8), ])          
Cadres_age = colSums(tableau[c(3, 9), ])       
Professions_inter_age = colSums(tableau[c(4, 10), ])
Employes_age = colSums(tableau[c(5, 11), ])
Ouvriers_age = colSums(tableau[c(6, 12), ])
categorie_age <- list(Agriculteurs_age,Artisans_age,Cadres_age,Professions_inter_age,Employes_age,Ouvriers_age)
H.A.C = 0
for(i in 1:length(categorie_age)){
  for(j in 1:length(categorie_age[[1]])){
    H.A.C <- H.A.C + (-categorie_age[[i]][j]*log2(categorie_age[[i]][j]))
  }
}
H.A.C <- as.numeric(H.A.C)
#Pour H(S,C)
femmes_catesociop <- rowSums(tableau[1:6,])
hommes_catesociop <- rowSums(tableau[7:12,])
sexe_catesociop <-list(femmes_catesociop, hommes_catesociop)
H.S.C = 0
for(i in 1:length(sexe_catesociop)){
  for(j in 1:length(sexe_catesociop[[1]])){
    H.S.C <- H.S.C + (-sexe_catesociop[[i]][j]*log2(sexe_catesociop[[i]][j]))
  }
}
H.S.C <- as.numeric(H.S.C)
# Calculons maintenant l'entropie suivante H(A,S,C)
H.A.S.C = 0
for (i in 1:nrow(tableau)) {
  for (j in 1:ncol(tableau)) {
    H.A.S.C <- H.A.S.C + (-tableau[i, j] * log2(tableau[i, j]))
  }
}
# Calculons les informations mutuelles I(A,SC) I(S,AC) I(C,AS)
I.A.SC = H.A + H.S.C - H.A.S.C
I.S.AC = H.S + H.A.C - H.A.S.C
I.C.AS = H.C + H.A.S - H.A.S.C
# On calcule les rapports
R1 <- I.A.SC / H.S.C
R2 <- I.S.AC / H.A.C
R3 <- I.C.AS / H.A.S

#Le rapport le plus eleve est R3, cela veut dire que l'environnement profesionnel est mieux expliqué par 
# le sexe et l age.

# Question 2 
# En reprenant les calculs plus haut.
I.A.S = H.A + H.S - H.A.S     
I.A.C = H.A + H.C - H.A.C
I.S.C = H.S + H.C - H.S.C      
Ib_A = I.A.S + I.A.C
Ib_S = I.A.S + I.S.C
Ib_C = I.A.C + I.S.C

