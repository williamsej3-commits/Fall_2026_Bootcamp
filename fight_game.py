print("Hello, World!")

ef attack_enemy(enemy_health, attack_power):
    new_enemy_health = enemy_health - attack_power
    return new_enemy_health


def check_enemy_status(enemy_name, enemy_health):
    if enemy_health <= 0:
        print(f"{enemy_name} has been defeated!")
    else:
        print(f"{enemy_name} is still standing.")


player_name = "Ryu"
enemy_name = "Shadow Bot"
enemy_health = 75
player_attack = 20

print(f"{player_name} attacks {enemy_name}!")

enemy_health = attack_enemy(enemy_health, player_attack)

print(f"{enemy_name} now has {enemy_health} health.")

check_enemy_status(enemy_name, enemy_health)