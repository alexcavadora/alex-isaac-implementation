# Project Summary – 10Leaf Test
## Part 1: Core Mechanics

### HealthComponent
**Type:** `Node2D`  
**Purpose:** Manages and displays health for both the player and enemies.

**Nodes:**
* `ProgressBar` or `TextureProgressBar` — Provides visual feedback for health (customizable size, position, and color).
* `Area2D` (as `HurtBox`) — Detects collisions and applies damage.

**Script:** `health_component.gd`

**Variables:**
* `hp: float` — Current health points of the entity.

**Functions:**
* `apply_damage(incoming_dmg: float) -> void` — Reduces `hp` by the specified damage value.
* `apply_heal(incoming_heal: float) -> void` — Increases `hp` by the specified heal value.

**Behavior:**
* When `hp <= 0`, the entity is removed from the scene using `queue_free()`.

---
### HitBoxComponent
**Type:** `Area2D`  
**Purpose:** Detects collisions for weapons or projectiles and reports damage.

**Nodes:**
* `CollisionShape2D` — Defines the collision area for the hitbox.

**Script:** `hitbox_component.gd`

**Variables:**
* `damage: float` — The amount of damage this hitbox can deal (configurable per weapon/projectile).

**Behavior:**
* Reports damage when a collision is detected.

---
### Projectile
**Type:** `Area2D`  
**Purpose:** Represents the player's attack mechanism.

**Nodes:**
* `CollisionShape2D` — Defines the collision area for the projectile.

**Script:** `projectile.gd`

**Variables:**
* `velocity: float` — The speed at which the projectile moves.
* `direction: Vector2` — The direction of movement, typically based on player input or mouse position.
* `lifespan: float` — The duration before the projectile disappears (`0` indicates infinite lifespan).
* `damage: float` — The amount of damage dealt on collision (exported for easy tuning).

**Behavior:**
* Moves in the specified `direction` using `_physics_process()`.
* On collision with an enemy, applies damage and updates the flag logic.
* Self-destructs after `lifespan` expires (if not `0`).

---
### Player
**Type:** `CharacterBody2D`  
**Purpose:** Represents the player character.

**Input Map:**  
* `player_move_up`, `player_move_down`, `player_move_left`, `player_move_right` — Controls movement.

**Script:** `player.gd`

**Variables:**
* `projectile_damage: float` — Damage dealt by the player's projectiles (exported for easy tuning).

**Behavior:**
* Moves based on velocity set in `_physics_process()`.
* Fires projectiles on input (e.g., spacebar or mouse click).
* Contains a `HealthComponent` to manage health.
* Removed from the scene when `hp <= 0`.

---
### Enemies
**Type:** `Area2D`  
**Purpose:** Represents enemy entities.

**Script:** `enemy.gd`

**Variables:**
* `starting_health: float` — Initial health of the enemy (default: 3).
* `color: String` — The assigned color of the enemy (Red, Blue, or Yellow).

**Behavior:**
* Contains a `HealthComponent` to track health.
* Takes damage when hit by a projectile.
* Dies and is removed from the scene when `hp <= 0`.

---
## Part 2: Color Logic & Flag Interaction
Each enemy is assigned one of the following colors:
* Red
* Blue
* Yellow

---
### Flag Behavior

**Purpose:** Updates the flag's color based on the combination of the last two enemies hit by projectiles.

**Sprites:**
* Initial state: White flag.
* Possible colors: Red, Blue, Yellow, Violet, Orange, Green.

**Logic:**
* Tracks the colors of the last two enemies hit.
* Determines the resulting color based on the following combinations:
    * Red + Blue = Violet
    * Red + Yellow = Orange
    * Blue + Yellow = Green
    * Same color twice → That color
* Updates the flag sprite to reflect the resulting color.

---
## Case Standards

| Element       | Style       |
| ------------- | ----------- |
| Classes/Nodes | PascalCase  |
| Variables     | snake_case  |
| Functions     | snake_case  |
| Scenes        | snake_case  |
| Scripts       | snake_case  |
| Constants     | SNAKE_CASE  |
| Global Nodes  | SNAKE_CASE  |
| Input Actions | snake_case  |
| Branch Names  | snake_case  |
