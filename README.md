# Echo: Lost Worlds

## Activity 1 — Godot & Git Setup

Game Overview

Echo: Lost Worlds is a 2D dark-fantasy dungeon action game focused on exploration, combat, character progression, and loot.

The game is inspired by dungeon-crawling and action games such as Minecraft Dungeons, Soul Knight, and My Heroes: Dungeon Raid, while taking visual and atmospheric inspiration from dark-fantasy indie games.

Players explore dangerous dungeons, fight strange enemies, discover powerful equipment, and become stronger through loot and progression.

Genre

2D Dark-Fantasy Dungeon Crawler / Action RPG

Core Features
Dungeon exploration
Fast-paced combat
Enemy encounters
Randomized loot
Item rarity and equipment
Character progression
Boss encounters
Dark-fantasy environments
Unique and strange creatures

![Godot Project](screenshots/01-godot-project.png)
Project Creation: The Echo mini-game project was created using Godot 4. The project was created as the foundation for the game's development.

![Scene Setup](screenshots/02-scene-setup.png)
A Node2D was created as the root node of the main scene, with a Sprite2D child added as the initial visual placeholder.

![Running Game](screenshots/03-running-game.png)
Project Testing: The project was launched successfully from Godot to verify that the main scene and project configuration were functioning correctly.

![Project Files](screenshots/04-project-files.png)
Project Files: The project directory contains the Godot project files, .gitignore, .gitattributes, and README documentation required for version control and project documentation.

![Git LFS Setup](screenshots/05-git-lfs.png)
Git LFS Configuration: Git Large File Storage was initialized and configured to track PNG image and WAV audio assets, allowing large game-development files to be handled appropriately by Git.

![Git Commit](screenshots/06-git-commit.png)
Initial Commit: The completed Week 1 project setup was committed to the local Git repository using the commit message Week 1: project setup + Hello World.

![Git Push](screenshots/07-git-push.png)
GitHub Synchronization: The local main branch was successfully pushed to the GitHub repository, establishing the remote repository for the project.

## Activity 2 — Gameplay Mechanics and Game Feel

<img width="1921" height="1082" alt="image" src="https://github.com/user-attachments/assets/8d1dc7d7-d33f-4c19-ba7a-c8de66207514" />
New sprite: I added a new sprite to my character/player downloaded from a Sprite website, New children Node were also added for the upcoming movement of the character which is the CharacterBody2D and its child CollisionShape2D and I also added the Icon(Sprite2D) as a child Node to CharacterBody2D. I also added the AttackArea2D for the Attack Animation for my sprite as well as 2 more child Nodes for it.

<img width="1491" height="834" alt="image" src="https://github.com/user-attachments/assets/7986eca8-df58-405d-8111-abeeb58a9232" />
Keybinds: I added the WASD and the Attack button for the movement of the Sprite.

<img width="402" height="445" alt="image" src="https://github.com/user-attachments/assets/75e992b0-8b95-491a-aa40-33f601e933a7" />
Coding the Movement + extra: Coded the necessary movement for the sprite and added animations like  the idle animation i got from the website together with this sprite. 

<img width="1481" height="450" alt="image" src="https://github.com/user-attachments/assets/9acda39e-ec1e-4eff-a5ca-928496111b5d" />
Coding Animation for attack: I coded the animation of the attack as well as small extra sprites during the slash.

<img width="1151" height="650" alt="image" src="https://github.com/user-attachments/assets/cd38e869-7465-42a6-a8c3-513faf486fcf" />
<img width="1146" height="645" alt="image" src="https://github.com/user-attachments/assets/150f89a8-f926-48d3-80f3-d21b9be79175" />
<img width="1151" height="646" alt="image" src="https://github.com/user-attachments/assets/15430d94-3f5b-46d7-847d-3ad2a653ce93" />
Testing Movement: Movement was somewhat smooth and the walking animation is fluid, idle animation gives a subtle life to the sprite so it was a nice addition.

<img width="1919" height="1072" alt="image" src="https://github.com/user-attachments/assets/f67d5d41-24ae-41d4-a8a3-f64080054d95" />
<img width="1921" height="1082" alt="image" src="https://github.com/user-attachments/assets/6506b8e9-7fc6-4f4c-be96-2c039f4104cd" />
<img width="1921" height="1082" alt="image" src="https://github.com/user-attachments/assets/1def26da-c944-4d6b-9baa-2d7e63a018b1" />
<img width="1921" height="1081" alt="image" src="https://github.com/user-attachments/assets/156352ef-dc6c-4aff-8dd5-227339e132e6" />
Testing Attack: Attack animations was implemented into the 4 directions depending to where the Sprite is looking, a simple animation of the Sprite was added during the slash and a custom pixelated effects at the slash was added.  


## Activity 3 — Level Design



https://github.com/user-attachments/assets/89ced82c-cbf8-4e94-ac13-98b43f25d974

I beta level who although has some bugs i ignore it for now since i want to showcase the progression and the purpose of the game. Before i added enemies i added chest, vases and jars which would soon be filled with loot. you can interact all of them its either you break them or you open. I created this level using sprites of chests and background miscellaneous and ofcoure assets I acquired online such as the tile map and the tile sheets.


## Week 4: Enemies and Sprites

Added 8 enemy types, each in its own dungeon room. Every enemy has 5 animations (idle, walk, attack, hurt, death) and is sized to match the player.

### Rat (Vault)
Fast and weak. The first enemy the player meets.

<img width="391" height="272" alt="Screenshot 2026-10-04 205313" src="https://github.com/user-attachments/assets/5dbadb36-a330-4376-9168-8891e1f9b046" />


### Slime (Cistern)
Slow, with a long attack wind-up.

<img width="370" height="279" alt="Screenshot 2026-10-04 205325" src="https://github.com/user-attachments/assets/47843aa3-16c2-4316-9610-24cf766c4805" />


### Mushroom (Crypt)
Short-range spit attack.

<img width="315" height="269" alt="Screenshot 2026-10-04 205329" src="https://github.com/user-attachments/assets/db7093fe-0193-4d66-8b42-169d7029f3db" />


### Bat (Forge)
Fast flyer that moves erratically.

<img width="261" height="261" alt="Screenshot 2026-10-04 205341" src="https://github.com/user-attachments/assets/4912d25f-1160-4184-99af-82ebfb5b4787" />


### Flying Eye (Eye Well)
Flies, with a ranged-style attack animation.

<img width="261" height="242" alt="Screenshot 2026-10-04 205355" src="https://github.com/user-attachments/assets/9c7ea1d4-18e9-4113-8c85-69558cd6a41b" />


### Goblin (Goblin Den)
Tougher melee enemy.

<img width="249" height="247" alt="Screenshot 2026-10-04 205400" src="https://github.com/user-attachments/assets/859e6659-c92a-4d2b-817a-7b13746561df" />


### Mimic (Mimic Den and Crypt)
Starts as a chest, then bursts open and chases the player.

<img width="259" height="256" alt="Screenshot 2026-10-04 210132" src="https://github.com/user-attachments/assets/9a825550-6231-453f-9c44-06f4de1cd43c" />


### Skeleton, boss (Bone Hall)
The toughest enemy, with double health.

<img width="217" height="295" alt="Screenshot 2026-10-04 205534" src="https://github.com/user-attachments/assets/c0ae106b-d41b-42a8-94ae-2a503c8322b7" />


### Also added this week
- Enemy AI: idle, chase, attack, hurt and death. Attacks only hurt during the animation's damage frames.
- Enemies wake up when the player enters their room and return home if the player runs too far away.
- Chests and enemies drop coins that the player collects by walking over them.
- HUD with hearts and a coin counter.
- Spike traps that only hurt while the spikes are out.
- Collision and draw-order fixes so the player no longer clips into walls.

---

## Week 5: Audio

Added music and sound effects, all played through one `AudioManager`.



https://github.com/user-attachments/assets/198a2819-933a-4868-b60e-a1d78d8c8e82



### What has sound
- Looping background music with a fade-in
- Player: sword slash, footsteps, getting hurt
- Loot and props: chest opening, coin drop, coin pickup, vase breaking, crate breaking
- Enemies: attack, hurt and death sounds for each species, plus the Mimic burst
- Traps: a knife sound when the spikes hit

### Details
- Enemy sounds only play when the enemy is near the player.
- Repeated sounds use small random pitch and volume changes.
- At most 3 copies of the same sound play at once, so coin showers stay clean.
- Music and effects are on separate audio buses, each with its own volume.

### Credits
- RPG sounds by Kenney (kenney.nl), CC0.
- Other effects from Freesound.
- Background music: (add the source here)
