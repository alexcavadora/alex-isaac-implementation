# Project Summary – 10Leaf Test (Planning)
## Part 1: Core Mechanics

### HealthComponent
**Type:** `Node2D` (used to manage or hide health UI)
**Purpose:** Manage and display health for both player and enemies.

**Nodes:**
* `ProgressBar` / `TextureProgressBar` for visual feedback (configurable size, position, and color).
* `Area2D` as `HurtBox`, detects collisions and applies damage.

**Script:** `health_component.gd`

**Variables:**
* `hp: float` — Current health points.

**Functions:**
* `apply_damage(incoming_dmg: float) -> void` — Subtracts from `hp`.
* `apply_heal(incoming_heal: float) -> void` — Adds to `hp`.

**Behavior:**
* On `hp <= 0`, entity is removed (`queue_free()`).

---
### HitBoxComponent
**Type:** `Area2D`
**Purpose:** Detect collisions for weapons/projectiles and report damage.

**Nodes:**
* `CollisionShape2D` to define area.

**Script:** `hitbox_component.gd`

**Variables:**
* `damage: float` — Can be adjusted per weapon/projectile.

---
### Projectile
**Type:** `Area2D`

**Nodes:**
* `CollisionShape2D` to define area.

**Purpose:** Player's attack mechanism.

**Variables:**
* `velocity: float` — Speed of projectile.
* `direction: Vector2` — Direction based on player facing or mouse.
* `lifespan: float` — Time before disappearing (`0` = infinite).
* `damage: float` — Damage dealt on hit (exported).

**Behavior:**
* Moves in `direction` using `_physics_process`.
* On collision with enemy, deals damage and triggers flag update.
* Self-destroys after `lifespan` (unless `0`).

---
### Player
**Type:** `CharacterBody2D`

 **Input Map:**`player_move_up`, `player_move_down`, `player_move_left`,`player_move_right`

**Behavior:**
* Movement via velocity set in `_physics_process()`.
* Shoots projectile on input (e.g., spacebar or mouse).
* Damage dealt by projectile is an `export var` for easy tuning.
* Holds a `HealthComponent` to track health.
* Removed from scene on `hp <= 0`.

---
### Enemies
**Type:** `Area2D`

**Behavior:**
* Have individual `HealthComponent` with starting health (default: 3).
* Get hit by projectile → lose health → die at 0.
* Assigned a unique color (see Part 2).

---
## Part 2: Color Logic & Flag Interaction
Each enemy is assigned one of:
* Red
* Blue
* Yellow

---
### Flag Behavior

**Purpose:** React to color combinations based on recent enemy hits.

**Sprites:**
* Initial state: White flag
* Colors: Red, Blue, Yellow, Violet, Orange, Green.

**Logic:**
* Track last two enemies hit by projectiles.
* Determine resulting color based on combinations:
	* Red + Blue → Violet
    * Red + Yellow → Orange
    * Blue + Yellow → Green
    * Same color twice → That color
* Flag sprite updates to match mixed result.

---
## Case standards

| Element       | Style       |
| ------------- | ----------- |
| Classes/Nodes | PascalCase  |
| Variables     | snake\_case |
| Functions     | snake\_case |
| Scenes        | snake\_case |
| Scripts       | snake\_case |
| Constants     | SNAKE\_CASE |
| Global Nodes  | SNAKE\_CASE |
| Input Actions | snake\_case |
| Branch Names  | snake\_case |
