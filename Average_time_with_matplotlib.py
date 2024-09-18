import matplotlib.pyplot as plt
import numpy as np

# Données pour Average Creation CPU Time
steps_creation = np.array([100000, 40000, 20000, 10000, 1000])
cpu_times_creation = np.array([0.97, 0.98, 1.01, 2.72, 3.59])

# Données pour Average Inference CPU Time
steps_inference = np.array([100000, 40000, 20000, 10000, 1000])
cpu_times_inference = np.array([5.98, 6.16, 6.28, 15.03, 18.91])

# Création de la première figure pour Average Creation CPU Time
plt.figure(figsize=(5, 4))

# Affichage des points et ligne pour Average Creation CPU Time
plt.scatter(steps_creation, cpu_times_creation, color='b', marker='X', s=100, label='Average Creation CPU Time', zorder=3)
plt.plot(steps_creation, cpu_times_creation, 'b:', alpha=0.6, zorder=2)  # Ligne bleue en pointillés

# Ajouter des étiquettes à côté de chaque point
for i in range(len(steps_creation)):
    x = steps_creation[i]
    y = cpu_times_creation[i]
    plt.text(x, y, f'{y:.2f}', fontsize=12, ha='left', va='bottom', color='black')

# Définition des limites de l'axe des y
plt.ylim(0, 4)  # Ajustez cette plage selon vos besoins

# Titre et labels
#plt.title('Average Creation CPU Time vs. Number of Steps')
plt.xlabel('Number of Steps')
plt.ylabel('Average CPU Time (milliseconds)')

# Ajouter une légende
plt.legend()

# Grille
plt.grid(True, which="both", ls="--", linewidth=0.7)

# Affichage de la première figure
plt.show()

# Création de la deuxième figure pour Average Inference CPU Time
plt.figure(figsize=(5, 4))

# Affichage des points et ligne pour Average Inference CPU Time
plt.scatter(steps_inference, cpu_times_inference, color='r', marker='X', s=100, label='Average Inference CPU Time', zorder=3)
plt.plot(steps_inference, cpu_times_inference, 'r:', alpha=0.6, zorder=2)  # Ligne rouge en pointillés

# Ajouter des étiquettes à côté de chaque point
for i in range(len(steps_inference)):
    x = steps_inference[i]
    y = cpu_times_inference[i]
    plt.text(x, y, f'{y:.2f}', fontsize=12, ha='left', va='bottom', color='black')

# Définition des limites de l'axe des y
plt.ylim(0, 20)  # Ajustez cette plage selon vos besoins

# Titre et labels
#plt.title('Average Inference CPU Time vs. Number of Steps')
plt.xlabel('Number of Steps')
plt.ylabel('Average CPU Time (milliseconds)')

# Ajouter une légende
plt.legend()

# Grille
plt.grid(True, which="both", ls="--", linewidth=0.7)

# Affichage de la deuxième figure
plt.show()

