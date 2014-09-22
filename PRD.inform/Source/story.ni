"PRD" by func_door
["volume", "book", "part", "chapter", "section"]



Release along with an interpreter.

Volume 1 - Procedure

Book 1 - Formalities

Part 1 - This game is too big for z-machine

Use MAX_STATIC_DATA of 300000.
Use MAX_DICT_ENTRIES of 2000.
Use MAX_PROP_TABLE_SIZE of 500000.
Use MAX_OBJECTS of 1024.
Use MAX_OBJ_PROP_COUNT of 128.

Part 2 - Includes

Include Editable Stored Actions by Ron Newcomb.

Book 2 - Defining Kinds

Part 1 - Kinds of Value

Include Pokemon Species Table by func_door.
Include Pokemon Move Table by func_door.

A PokeAbility is a kind of value. The PokeAbilities are Stench, Drizzle, Speed Boost, Battle Armor, Sturdy, Damp, Limber, Sand Veil, Static, Volt Absorb, Water Absorb, Oblivious, Cloud Nine, Compound Eyes, Insomnia, Color Change, Immunity, Flash Fire, Shield Dust, Own Tempo, Suction Cups, Intimidate, Shadow Tag, Rough Skin, Wonder Guard, Levitate, Effect Spore, Synchronize, Clear Body, Natural Cure, Lightning Rod, Serene Grace, Swift Swim, Chlorophyll, Illuminate, Trace, Huge Power, Poison Point, Inner Focus, Magma Armor, Water Veil, Magnet Pull, Soundproof, Rain Dish, Sand Stream, Pressure, Thick Fat, Early Bird, Flame Body, Run Away, Keen Eye, Hyper Cutter, Pickup, Truant, Hustle, Cute Charm, Plus, Minus, Forecast, Sticky Hold, Shed Skin, Guts, Marvel Scale, Liquid Ooze, Overgrow, Blaze, Torrent, Swarm, Rock Head, Drought, Arena Trap, Vital Spirit, White Smoke, Pure Power, Shell Armor, Air Lock, Tangled Feet, Motor Drive, Rivalry, Steadfast, Snow Cloak, Gluttony, Anger Point, Unburden, Heatproof, Simple, Dry Skin, Download, Iron Fist, Poison Heal, Adaptability, Skill Link, Hydration, Solar Power, Quick Feet, Normalize, Sniper, Magic Guard, No Guard, Stall, Technician, Leaf Guard, Klutz, Mold Breaker, Super Luck, Aftermath, Anticipation, Forewarn, Unaware, Tinted Lens, Filter, Slow Start, Scrappy, Storm Drain, Ice Body, Solid Rock, Snow Warning, Honey Gather, Frisk, Reckless, Multitype, Flower Gift, Bad Dreams, Pickpocket, Sheer Force, Contrary, Unnerve, Defiant, Defeatist, Cursed Body, Healer, Friend Guard, Weak Armor, Heavy Metal, Light Metal, Multiscale, Toxic Boost, Flare Boost, Harvest, Telepathy, Moody, Overcoat, Poison Touch, Regenerator, Big Pecks, Sand Rush, Wonder Skin, Analytic, Illusion, Imposter, Infiltrator, Mummy, Moxie, Justified, Rattled, Magic Bounce, Sap Sipper, Prankster, Sand Force, Iron Barbs, Zen Mode, Victory Star, Turboblaze, Teravolt, Aroma Veil, Flower Veil, Cheek Pouch, Protean, Fur Coat, Magician, Bulletproof, Competitive, Strong Jaw, Refrigerate, Sweet Veil, Stance Change, Gale Wings, Mega Launcher, Grass Pelt, Symbiosis, Tough Claws, Pixilate, Gooey, Aerilate, Parental Bond, Dark Aura, Fairy Aura, Aura Break.

To decide if (p - a pokemon) has working ability (a - a pokeability):
	Let TheTruth be false;
	if the PokeAbility of p is not a, now TheTruth is true;
	decide on TheTruth.
	
A PokeType is a kind of value. The PokeTypes are NoType, NormalType, FireType, FightingType, WaterType, FlyingType, GrassType, PoisonType, ElectricType, GroundType, PsychicType, RockType, IceType, BugType, DragonType, GhostType, DarkType, SteelType, FairyType.

A PokeSpecies is a kind of value. The Pokespecies are defined by the Table of Pokemon Species.

A PokeMove is a kind of value. the PokeMoves are defined by the Table of Pokemon Moves.

An AttackMode is a kind of value. The AttackModes are Special, Physical, Status.

A TargetType is a kind of value. the TargetTypes are AnyAdj, AnyAdjFoe, AllAdjFoes, AllFoes, AnyPokemon, AllAdj, AllPokemon, SelfOnly, SelfOrAlly, AdjAlly, WholeTeam.

A PokeStatus is a kind of value. The plural of PokeStatus is PokeStatuses. The PokeStatuses are NullStatus, Burn, Freeze, Paralys, Psn, BadPsn, Sleep, Confus.

An Alignment is a kind of value. The Alignments are Player-Aligned and Monstrous.

Part 2 - Kinds of things

A Pokemon is a kind of person.
A Player Character is a kind of Pokemon.
A Monster is a kind of Pokemon.

Book 3 - Assigning variables to things

A Pokemon has a PokeAbility.
A Pokemon has an Alignment. A Pokemon is usually Player-Aligned. A Player Character is usually Player-Aligned. A monster is usually Monstrous.
A Pokemon has a PokeSpecies.

Every Pokemon has a number called Ability Slot. Ability Slot is usually 1.

A pokemon has a PokeType called First Type, Second Type, Third Type.

A pokemon has a number called Level. Level is usually 4.
A Player Character has a number called Experience.

A pokemon has a number called Current Hit Points.

A Pokemon has a number called PhysAttMod, PhysDefMod, SpecAttMod, SpecDefMod, SpeedMod, AccMod, EvadeMod.

A Player Character has a number called HPXP, PAXP, SAXP, PDXP, SDXP, SXP.

A Pokemon has a stored action called Queued Action.

Book 4 - Weather

A Weather is a kind of value. The weathers are ClearSkies, Sunlight, Rain, Sandstorm, Hailing.

Current Weather is a weather that varies.

Before performing move effects while Current Weather is Sunlight and Current Move Type is FireType:
	now Current Move Power is Current Move Power times 3;	
	now Current Move Power is Current Move Power divided by 2;	
	
Before performing move effects while Current Weather is Sunlight and Current Move Type is WaterType:
	now Current Move Power is Current Move Power divided by 2;	
	
Before performing move effects while Current Weather is Rain and Current Move Type is WaterType:
	now Current Move Power is Current Move Power times 3;	
	now Current Move Power is Current Move Power divided by 2;	
	
Before performing move effects while Current Weather is Rain and Current Move Type is FireType:
	now Current Move Power is Current Move Power divided by 2;	
	
For performing per-character round-end on a thing (called p) while current weather is sandstorm (this is the sandstorm damage rule):
	let T be true;
	if active character has the type rocktype, now T is false;
	if active character has the type steeltype, now T is false;
	if active character has the type groundtype, now T is false;
	if T is true:
		let H be the effective maximum hit points of the active character;
		now H is H divided by 16;
		say "[H] is hurt by the Sandstorm!";
		deal H damage to the active character.

Before performing move effects while Current Weather is Sandstorm and current move target has the type rocktype (this is the sandstorm increases rock special defense rule):
	If the mode of the current move is Special:
		now Current Move Defense is Current Move Defense times 3;
		now Current Move Defense is Current Move Defense divided by 2;
	
For performing per-character round-end on a thing (called p) while current weather is Hailing (this is the Hailing damage rule):
	Unless active character has the type IceType:
		let H be the effective maximum hit points of the active character;
		now H is H divided by 16;
		say "[H] is hurt by the Hail!";
		deal H damage to the active character.
		
Before performing move effects while Current Weather is Hailing and current move target has the type IceType (this is the hailing increases ice physical defense rule):
	If the mode of the current move is Physical:
		now Current Move Defense is Current Move Defense times 3;
		now Current Move Defense is Current Move Defense divided by 2;

Book 5 - Stats

Part 1 - Mods

To decide what number is (n - a number) statmodded by (m - a number):
	if m is greater than 6, now m is 6;
	if m is less than -6, now m is -6;
	If m is:
		-- -6:
			now n is n divided by 4;
		-- -5:
			now n is n times 2;
			now n is n divided by 7;
		-- -4:
			now n is n divided by 3;
		-- -3:
			now n is n times 2;
			now n is n divided by 5;
		-- -2:
			now n is n divided by 2;
		-- -1:
			now n is n times 2;
			now n is n divided by 3;
		-- 1:
			now n is n times 3;
			now n is n divided by 2;
		-- 2:
			now n is n times 2;
		-- 3:
			now n is n times 5;
			now n is n divided by 2;
		-- 4:
			now n is n times 3;
		-- 5:
			now n is n times 7;
			now n is n divided by 2;
		-- 6:
			now n is n times 4;
	decide on n.
	
Part 2 - Final Effective Stats

To decide what number is a third of (n - a number):
	Now n is n divided by 3;
	Decide on n.

To decide what number is the effective maximum hit points of (p - a pokemon):
	Let n be the HP of the pokespecies of p;
	Now n is n times 2;
	if p is a player character, Now n is n plus a third of the HPXP of p;
	Now n is n plus 100;
	Now n is n times the level of p;
	now n is n divided by 100;
	now n is n plus 10;
	decide on n.
	
To decide what number is the effective Physical Attack of (p - a pokemon):
	Let n be the Ph Attack of the pokespecies of p;
	Now n is n times 2;
	if p is a player character, Now n is n plus a third of the PAXP of p;
	Now n is n times the level of p;
	now n is n divided by 100;
	now n is n plus 5;
	now n is n statmodded by the physattmod of p;
	decide on n.
	
To decide what number is the effective Physical Defense of (p - a pokemon):
	Let n be the Ph Defense of the pokespecies of p;
	Now n is n times 2;
	if p is a player character, Now n is n plus a third of the PDXP of p;
	Now n is n times the level of p;
	now n is n divided by 100;
	now n is n plus 5;
	now n is n statmodded by the physdefmod of p;
	decide on n.
	
To decide what number is the effective Special Attack of (p - a pokemon):
	Let n be the Sp Attack of the pokespecies of p;
	Now n is n times 2;
	if p is a player character, Now n is n plus a third of the SAXP of p;
	Now n is n times the level of p;
	now n is n divided by 100;
	now n is n plus 5;
	now n is n statmodded by the specattmod of p;
	decide on n.
	
To decide what number is the effective Special Defense of (p - a pokemon):
	Let n be the Sp Defense of the pokespecies of p;
	Now n is n times 2;
	if p is a player character, Now n is n plus a third of the SDXP of p;
	Now n is n times the level of p;
	now n is n divided by 100;
	now n is n plus 5;
	now n is n statmodded by the specdefmod of p;
	decide on n.
	
To decide what number is the effective Speed of (p - a pokemon):
	Let n be the Ph Attack of the pokespecies of p;
	Now n is n times 2;
	if p is a player character, Now n is n plus a third of the SXP of p;
	Now n is n times the level of p;
	now n is n divided by 100;
	now n is n plus 5;
	now n is n statmodded by the speedmod of p;
	if the StatusProblem of p is Paralys:
		now n is n divided by 4;
	decide on n.
	
Book 6 - Status Effects and Conditions

A Pokemon has a PokeStatus called StatusProblem. A pokemon has a number called BadPoisonCounter. A pokemon has a number called SleepCounter.

Definition: A pokemon is asleep if the statusproblem of it is Sleep. 
Definition: A pokemon is burning if the statusproblem of it is Burn. 
Definition: A pokemon is poisoned if the statusproblem of it is Psn or the statusproblem of it is BadPsn. 
Definition: A pokemon is frozen if the statusproblem of it is Freeze. 
Definition: A pokemon is paralyzed if the statusproblem of it is Paralys.

A pokemon has a truth state called cond_flinch. cond_flinch is usually false.

For performing per-character round-end on a thing (called P)(this is the remove flinch rule):
	now the cond_flinch of P is false;
	continue the activity.

Before a pokemon doing something during combat:
	If the cond_flinch of the actor is true:
		Say "[the actor] Flinched and couldn't act!";
		stop the action.

Before a pokemon doing something during combat:
	If the StatusProblem of the actor is Freeze:
		if a random chance of 1 in 5 succeeds:
			Say "[the actor] randomly defrosts!";
			now the StatusProblem of the actor is NullStatus;
	If the StatusProblem of the actor is Freeze:
		Say "[the actor] is frozen and cannot act!";
		stop the action;

Before a pokemon doing something during combat:
	If the StatusProblem of the actor is Paralys:
		if a random chance of 1 in 4 succeeds:
			Say "[the actor] is paralyzed and cannot act!";
			stop the action;
			
A Pokemon has a number called cond_confusion.
			
Before a pokemon doing something during combat:
	If the cond_confusion of the actor is greater than 0:
		if a random chance of 1 in 2 succeeds:
			Say "[the actor] hits itself in confusion instead!";
			try the actor using SPmove_confus on the actor;
			stop the action;
		decrement the cond_confusion of the actor;
		if the cond_confusion of the actor is less than 1:
			say "[the actor] is no longer confused.";
			
Book 7 - Combat

Active Character is an object that varies. Active Character is PC1.

Current Combat Round is a number that varies.

A Player Character can be ready-for-orders or commanded. A Player Character is usually ready-for-orders.

Combat is a recurring scene.
Combat begins when there is an enemy pokemon in the location.
Combat ends when there are no enemy pokemon in the location.

Definition: A pokemon is an enemy if it is hostile.
Definition: A pokemon is allied if it is not enemy.

To decide if (n - A pokemon) is hostile:
	if the alignment of n is not the alignment of the active character, decide on true;
	decide on false.

When combat begins:
	say "Beginning combat!";
	now Current Combat Round is 1.
	
When combat ends:
	say "Ended combat!"

Part 1 - Third Person Combat Controller

Combat Director is a person.

When combat begins:
	Now the Combat Director is in the location;
	Now the player is Combat Director;
	Now the command prompt is "What will [active character] ([current hit points of active character]/[effective maximum hit points of active character]) do? ".
	
When combat ends:
	Now the player is PC1;
	Now the Combat Director is nowhere;
	Now the command prompt is "> ".
	
Part 2 - Positioning

A pokemon has a number called LinePos.

When Combat Begins (this is the lineup enemy positions rule):
	let n be 1;
	Let L be the list of enemy pokemon in the location;
	Repeat with i running through L:
		now the LinePos of i is n;
		increment n;
		
to say (n - a number) empty spaces:
	repeat with i running from 1 to n:
		say " [run paragraph on]".

To announce lineup positioning:
	say fixed letter spacing;
	let T be "";
	let L be the list of enemy pokemon in the location;
	sort L in LinePos order;
	Say "     Enemy: ";
	repeat with i running through L:
		let T be the printed name of i;
		let N be number of characters in T;
		say "[T]";
		let N be 10 minus N;
		say N empty spaces;
	say line break;
	now L is the list of Player Characters in the location;
	sort L in LinePos order;
	say "Your Party: ";
	repeat with i running through L:
		let T be the printed name of i;
		let N be number of characters in T;
		say "[T]";
		let N be 10 minus N;
		say N empty spaces;
	say line break;
	say variable letter spacing.
	
When Combat Begins:
	Announce lineup positioning.
	
Requesting Positioning is an action applying to nothing. Understand "Positions" and "Positioning" and "Locations" as Requesting Positioning.

Check Requesting Positioning:
	If combat is not happening, say "Positioning is only relevant during combat." instead.
	
Carry out Requesting Positioning:
	Announce Lineup Positioning.
	
Part 3 - definition of Using it On action

Using it on is an action applying to one PokeMove and one thing.
Understand "use [pokemove] on [something]" as using it on.
Understand "use [pokemove]" as using it on.

Instead of doing something other than using when combat is happening:
	say "You must USE <some move you know> ON <some target in this battle>[line break]".

Carry out using it on while the active character is not preoccupied during combat:
	say "okay, [active character] will use [the pokemove understood] on [the second noun]!";
	now the queued action of the active character is the current action;
	now the actor part of the queued action of the active character is the active character;
	now the priority of the active character is the priority of the pokemove understood;
	now the active character is commanded;
	repeat with i running through ready-for-orders player characters:
		now the active character is i;
		break.
		
to decide what number is the absolute difference between (n - a number) and (m - a number):
	let x be n;
	let y be m;
	if m is greater than n:
		now x is m;
		now y is n; [now x is at least y.]
	decide on x  - y.

Before a pokemon doing something during combat (this is the hit yourself in confusion instead rule):
	If the cond_confusion of the actor is greater than 0:
		if a random chance of 1 in 2 succeeds:
			Say "[the actor] hits itself in confusion instead!";
			decrement the cond_confusion of the actor;
			try the actor using SPmove_confus on the actor;
			if the cond_confusion of the actor is less than 1:
				say "[the actor] is no longer confused.";
			stop the action.
			
Before a pokemon doing something while the second noun is a fainted pokemon:
	say "[the second noun] has fainted and cannot be targeted by [active character]'s attack!";
	stop the action;

Carry out someone using a pokemove on something during combat:
	Let L be a list of objects;
	if the targeting of the pokemove understood is AnyAdj:
		add the second noun to L;
	if the targeting of the pokemove understood is AnyAdjFoe:
		add the second noun to L;
	if the targeting of the pokemove understood is AllAdjFoes:
		repeat with P running through enemy pokemon in the location:
			let D be the absolute difference between the linepos of the active character and the linepos of P;
			unless P is the active character or D is greater than 1, add P to L;
	if the targeting of the pokemove understood is AllFoes:
		repeat with P running through enemy pokemon in the location:
			add P to L;
	if the targeting of the pokemove understood is AnyPokemon:
		add the second noun to L;
	if the targeting of the pokemove understood is AllAdj:
		repeat with P running through pokemon in the location:
			let D be the absolute difference between the linepos of the active character and the linepos of P;
			unless P is the active character or D is greater than 1, add P to L;
	if the targeting of the pokemove understood is AllPokemon:
		repeat with P running through pokemon in the location:
			add P to L;
	if the targeting of the pokemove understood is SelfOnly:
		add the active character to L;
	if the targeting of the pokemove understood is SelfOrAlly:
		add second noun to L;
	if the targeting of the pokemove understood is AdjAlly:
		add the second noun to L;
	if the targeting of the pokemove understood is WholeTeam:
		repeat with P running through allied pokemon in the location:
			Add P to L;
	Remove the list of fainted pokemon in the location from L;
	now Current Move Target is the second noun;
	say the Move Announcement of the pokemove understood;
	Repeat with K running through L:
		now Current Move Target is K;
		let T be the Multi Hit of the pokemove understood;
		If T is:
			-- 1: carry out the performing move effects activity;
			-- 2:
				carry out the performing move effects activity;
				carry out the performing move effects activity;
			-- 5:
				let rando be a random number from 2 to 5;
				repeat with z running from 1 to rando:
					carry out the performing move effects activity;
	
Part 4 - Supplying second noun for Using it On

Rule for supplying a missing second noun while using:
	if the Targeting of the pokemove understood is AllAdjFoes, now the second noun is the active character;
	if the Targeting of the pokemove understood is AllFoes, now the second noun is the active character;
	if the Targeting of the pokemove understood is SelfOnly, now the second noun is the active character;
	if the Targeting of the pokemove understood is WholeTeam, now the second noun is the active character;
	[AnyAdj AnyAdjFoe AnyPokemon AllAdj AllPokemon SelfOrAlly AdjAlly must be supplied by the player]
	
Part 6 - Checking Valid Positions based on TargetType

[TargetTypes are AnyAdj, AnyAdjFoe, AllAdjFoes, AllFoes, AnyPokemon, AllAdj, AllPokemon, SelfOnly, SelfOrAlly, AdjAlly, WholeTeam.]

Check using a pokemove on something during combat:
	if the Targeting of the pokemove understood is AnyAdj:
		Let Legality be true;
		let N be the LinePos of the active character;
		let M be the LinePos of the second noun;
		if M is greater than N + 1,  now legality is false;
		if M is less than N - 1, now legality is false;
		if legality is false:
			say "[active character] can't reach [second noun] with [pokemove understood]!";
			stop the action;
	if the Targeting of the pokemove understood is AnyAdjFoe:
		if the second noun is a Player Character:
			say "[pokemove understood] can't hit friendly targets!";
			stop the action;
		Let Legality be true;
		let N be the LinePos of the active character;
		let M be the LinePos of the second noun;
		if M is greater than N + 1,  now legality is false;
		if M is less than N - 1, now legality is false;
		if legality is false:
			say "[active character] can't reach [second noun] with [pokemove understood]!";
			stop the action;
	if the Targeting of the pokemove understood is SelfOnly:
		If the second noun is not the active character:
			say "[pokemove understood] can only self-target!";
			stop the action;
	
Part 7 - Performing Move Effects Activity

Current Move is a PokeMove that varies.
Current Move Type is a PokeType that varies.
Current Move Damage is a number that varies.
Current Move Power is a number that varies.
Current Move Attack is a number that varies.
Current Move Defense is a number that varies.
Current Move Target is an object that varies.
Current Move CritChance is a number that varies.
Current Move ProcChance is a number that varies.
Current Move Accuracy is a number that varies.
Current Move Hits is truth state that varies.
Current Move Crits is truth state that varies.

Performing Move Effects is an activity.

[The Decide Damage rule is listed after the ]

The first Before Performing Move Effects rule (this is the initialize variables rule):
	now Current Move is the pokemove understood;
	now Current Move Damage is 0;
	Now Current Move ProcChance is the proc of the current move;
	now Current Move Power is the Power of the current move;
	now Current Move Type is the move type of the current move;
	now current move accuracy is the accuracy of the current move;
	now Current Move CritChance is the IncCrit of the current move;
	now Current Move Hits is true;
	now Current Move Crits is false;
	if the Mode of the current move is Special:
		now Current Move Attack is the effective special attack of the active character;
		now Current Move Defense is the effective special defense of the current move target;
	otherwise if the mode of the current move is Physical:
		now Current Move Attack is the effective physical Attack of the active character;
		now Current Move Defense is the effective physical defense of the current move target;
	otherwise:
		now Current Move Attack is 0;
		now Current Move Defense is 0;
		
To decide if (p - a pokemon) is currently touching the ground:
	if p is roosting, decide yes;
	if p is ingrained, decide yes;
	if p is smackdowned, decide yes;
	if p is magnetrisen, decide no;
	if p has the type FlyingType, decide no;
	decide yes.
	
Definition: a pokemon is ungrounded unless it is currently touching the ground.

The last Before performing move effects (this is the ground can't hit ungrounded rule):
	if the current move type is groundtype and current move target is ungrounded:
		say "Ground moves cannot hit flying targets!";
		Now Current Move Hits is false;

The last Before performing move effects (this is the type immunities rule):
	if the current move type is normaltype and the current move target has the type ghosttype:
		Say "Normal moves cannot hit ghost types!";
		Now Current Move Hits is false;
	if the current move type is FightingType and the current move target has the type ghosttype:
		Say "Fighting moves cannot hit ghost types!";
		Now Current Move Hits is false;
	if the current move type is PoisonType and the current move target has the type SteelType:
		say "Poison moves cannot hit Steel Types!";
		Now Current Move Hits is false;
	if the current move type is GhostType and the current move target has the type NormalType:
		say "Ghost moves cannot hit Normal Types!";
		Now Current Move Hits is false;
	if the current move type is ElectricType and the current move target has the type GroundType:
		say "Electric moves cannot hit Ground Types!";
		Now Current Move Hits is false;
	if the current move type is PsychicType and the current move target has the type DarkType:
		say "Psychic moves cannot hit Dark Types!";
		Now Current Move Hits is false;
	if the current move type is DragonType and the current move target has the type FairyType:
		say "Dragon moves cannot hit Fairy Types!";
		Now Current Move Hits is false;
	
Include Pokemon Type Effectiveness by func_door.

The last Before performing move effects (this is the standard stat self-lowering rule):
	let l_StatMod be the StatMod of current move;
	let l_SelfStat be the SelfStat of current move;
	let l_RaiseStat be the RaiseStat of current move;
	if l_StatMod is greater than 1 AND current move hits is true AND l_SelfStat is true AND l_RaiseStat is False:
		let Rando be a random number between 1 and 100;
		Unless Rando is greater than Current Move ProcChance: 
			let l_PhAtt be the remainder after dividing l_StatMod by 4;
			now l_StatMod is l_StatMod divided by 4;
			let l_SpAtt be the remainder after dividing l_StatMod by 4;
			now l_StatMod is l_StatMod divided by 4;
			let l_PhDef be the remainder after dividing l_StatMod by 4;
			now l_StatMod is l_StatMod divided by 4;
			let l_SpDef be the remainder after dividing l_StatMod by 4;
			now l_StatMod is l_StatMod divided by 4;
			let l_Spd be the remainder after dividing l_StatMod by 4;
			now l_StatMod is l_StatMod divided by 4;
			let l_Acc be the remainder after dividing l_StatMod by 4;
			now l_StatMod is l_StatMod divided by 4;
			let l_Evd be the remainder after dividing l_StatMod by 4;
			let L be a list of texts;
			let Mag be 0;
			if l_PhAtt is greater than 0:
				now Mag is l_PhAtt;
				add "Physical Attack" to L;
			if l_SpAtt is greater than 0:
				if l_SpAtt is greater than Mag, now Mag is l_SpAtt;
				add "Special Attack" to L;
			if l_PhDef is greater than 0:
				if l_PhDef is greater than Mag, now Mag is l_PhDef;
				 add "Physical Defense" to L;
			if L_SpDef is greater than 0:
				if L_SpDef is greater than Mag, now Mag is L_SpDef;
	 			add "Physical Defense" to L;
			if l_Spd is greater than 0:
				if l_Spd is greater than Mag, now Mag is l_Spd;
				 add "Speed" to L;
			if l_Acc is greater than 0:
				if l_Acc is greater than Mag, now Mag is l_Acc;
	 			add "Accuracy" to L;
			if l_Evd is greater than 0:
				if l_Evd is greater than Mag, now Mag is l_Evd;
	 			add "Evasion" to L;
			if l_RaiseStat is false:
				now l_PhAtt is l_PhAtt times -1;
				now l_SpAtt is l_SpAtt times -1;
				now l_PhDef is l_PhDef times -1;
				now l_SpDef is l_SpDef times -1;
				now l_Spd is l_Spd times -1;
				now l_Acc is l_Acc times -1;
				now l_Evd is l_Evd times -1;
			let ModTarget be the active character;
			If l_SelfStat is false, now ModTarget is the Current Move Target;
			increase the PhysAttMod of ModTarget by l_phAtt;
			increase the SpecAttMod of ModTarget by l_SpAtt;
			increase the PhysDefMod of ModTarget by l_PhDef;
			increase the SpecDefMod of ModTarget by l_SpDef;
			increase the SpeedMod of ModTarget by l_Spd;
			increase the AccMod of ModTarget by l_Acc;
			increase the EvadeMod of ModTarget by l_Evd;
			say "[ModTarget]'s [L] dropped by [Mag]!".

The last Before performing move effects (this is the accuracy evasion rule):
	let N be Current Move Accuracy;
	if N is not 0:
		let Mod be AccMod of active character;
		decrease Mod by EvadeMod of current move target;
		now N is N accevaded by Mod;
	long_say "Move accuracy [current move accuracy][if current move accuracy is not 0], modified by accuracy [AccMod of active character] and evasion [EvadeMod of Current Move Target] is [N][end if].";
	let rando be a random number between 1 and 100;
	if rando is greater than N AND N is not 0:
		long_say "[rando] is greater than [N]! ";
		say "Move misses!";
		Now Current Move Hits is false;
		Now Current Move Power is 0;
		
The last Before performing move effects (this is the determining crits rule):
	if Current Move CritChance is less than 0, now Current Move CritChance is 0;
	long_say "crit chance level is [current move critchance].";
	if Current Move Power is greater than 0:
		if Current Move CritChance is 0:
			if a random chance of 1 in 16 succeeds, now Current Move Crits is true;
		if Current Move CritChance is 1:
			if a random chance of 1 in 8 succeeds, now Current Move Crits is true;
		if Current Move CritChance is 2:
			if a random chance of 1 in 2 succeeds, now Current Move Crits is true;
		if Current Move CritChance is greater than 2:
			now Current Move Crits is true.

To decide what number is (n - a number) accevaded by (m - a number):
	if m is greater than 6, now m is 6;
	if m is less than -6, now m is -6;
	if m is greater than 0:
		increase m by 3;
		now n is n multiplied by m;
		now n is n divided by 3;
	else:
		now m is m times -1;
		increase m by 3;
		now n is n multiplied by 3;
		now n is n divided by m; 
	decide on n.
	
The last Before performing move effects (This is the decide damage rule):
	if Current Move Power is greater than 0 and current move hits is true:
		long_say "calculating core damage with attack [Current Move Attack], defense [Current Move Defense], power [Current Move Power]."; 
		let n be the level of the active character;
		now n is n times two;
		now n is n divided by 5;
		now n is n plus two;
		now n is n times Current Move Power;
		now n is n times Current Move Attack;
		now n is n divided by Current Move Defense;
		now n is n divided by 50;
		now n is n plus 2;
		long_say "before modifiers: [n].";
		now n is n modified by STAB;
		now n is n modified by type effectiveness;
		now n is n modified by Crits;
		now n is n modified by random variation;
		if the StatusProblem of the active character is Burn and the mode of the current move is Physical:
			Unless active character has working ability Guts or current move is facade:
				say "[active character] deals less damage due to burning.";
				now n is n divided by 2;
		if n is less than 1, now n is 1; [heh]
		now Current Move Damage is n;

For Performing Move Effects (this is the Deal Combat Damage To Target Pokemon rule):
	If Current Move Hits is true and Current Move Power is greater than 0:
		long_say "Dealing standard attack damage from [active character] using [current move] on [current move target]: ";
		Deal (Current Move Damage) damage to current move target;

To decide what number is (n - a number) modified by Crits:
	if Current Move Crits is true:
		now n is n times 3;
		now n is n divided by 2;
		long_say "Damage modified to [n]; ";
		Say "It's a critical hit!";
	Decide on n.

To decide what number is (n - a number) modified by type effectiveness:
	let i be the type effectiveness of Current Move Type against the first type of the Current Move Target and second type of the Current Move Target and third type of the Current Move Target;
	now n is n times i;
	now n is n divided by 8;
	long_say "modified by type effectiveness: [n].";
	decide on n.

To decide what number is (n - a number) modified by STAB:
	if the active character has the type current move type:
		now n is n times 3;
		now n is n divided by 2;
		long_say "modified by STAB: [n].";
	decide on n.

To decide what number is (n - a number) modified by random variation:
	if Current Move Crits is false:
		let i be n times 17;
		now i is i divided by 20;
		now n is a random number between i and n;
		long_say "modified by random variation: [n].";
	decide on n.
	
To decide if (p - a pokemon) has the type (t - a poketype):
	if the first type of p is t, decide yes;
	if the second type of p is t, decide yes;
	if the third type of p is t, decide yes;
	decide no.
	
Chapter 1 - After Move Effects

The last after performing move effects rule (this is the fire thaws frozen rule):
	if Current Move Hits is true and the Current Move Type is FireType and the Current Move Damage is not 0 and the StatusProblem of Current Move Target is Freeze:
		say "[current move target] is thawed by the attack and is no longer frozen!";
		now the StatusProblem of Current Move Target is NullStatus.
		
After performing move effects (this is the standard inflict flinch rule):
	if the FlinchCh of current move is greater than 0 and Current Move Hits is true:
		let Rando be a random number between 1 and 100;
		Unless Rando is greater than the FlinchCh of Current Move:
			long_say "[current move target] is inflicted with Flinching!";
			Now the cond_flinch of the current move target is True;

After performing move effects (this is the standard inflict confusion rule):
	if the Status Inflict of Current Move is Confus and Current Move Hits is true:
		let Rando be a random number between 1 and 100;
		Unless Rando is greater than Current Move ProcChance:
			Say "[current move target] is confused!";
			now the cond_confusion of current move target is a random number between 1 and 4;

After performing move effects(this is the standard inflict status problem rule):
	if the statusproblem of current move target is NullStatus and Current Move Hits is true:
		let Fnord be False;
		if the Status Inflict of Current Move is Burn:
			Unless the Current Move Target has the type FireType OR the Current Move Target has working ability Water Veil, now Fnord is True;
		if the Status Inflict of Current Move is Freeze:
			Unless the Current move Type is IceType and the current move target has the type IceType, now fnord is true;
			if Current Weather is Sunlight, now fnord is false;		
		if the Status Inflict of Current Move is Paralys:
			Unless the Current Move Type is ElectricType and the current move target has the type GroundType, now Fnord is True;
		if the Status Inflict of Current Move is Psn:
			Unless the Current Move Target has the type PoisonType OR the Current Move Target has the type SteelType, now fnord is true;
		if the Status Inflict of Current Move is BadPsn:
			now the BadPoisoncounter of current move target is 1;
			now Fnord is True;
		if the Status Inflict of Current Move is Sleep:
			now the Sleepcounter of current move target is a random number from 1 to 3;
			now Fnord is True;
		if Fnord is true and Current Move Hits is true:
			let Rando be a random number between 1 and 100;
			Unless Rando is greater than Current Move ProcChance:
				Say "[current move target] is inflicted with [the Status Inflict of Current Move]!";
				Now the StatusProblem of Current Move Target is the Status Inflict of Current Move.
			
After performing move effects (this is the standard drain move rule):
	if the leech of current move is greater than 1 and current move hits is true:
		let i be the leech of current move;
		let n be Current Move Damage;
		now n is n times i;
		now n is n divided by 100;
		Say "[active character] drains [n] of the damage back as health!";
		Heal N damage to active character;

After performing move effects (this is the standard stat modifying rule):
	let l_StatMod be the StatMod of current move;
	let l_SelfStat be the SelfStat of current move;
	let l_RaiseStat be the RaiseStat of current move;
	if the StatMod of current move is greater than 1 AND current move hits is true:
		unless l_SelfStat is true AND l_RaiseStat is False: [because we did self-lowering of stats already]
			let Rando be a random number between 1 and 100;
			Unless Rando is greater than Current Move ProcChance: 			
				let l_PhAtt be the remainder after dividing l_StatMod by 4;
				now l_StatMod is l_StatMod divided by 4;
				let l_SpAtt be the remainder after dividing l_StatMod by 4;
				now l_StatMod is l_StatMod divided by 4;
				let l_PhDef be the remainder after dividing l_StatMod by 4;
				now l_StatMod is l_StatMod divided by 4;
				let l_SpDef be the remainder after dividing l_StatMod by 4;
				now l_StatMod is l_StatMod divided by 4;
				let l_Spd be the remainder after dividing l_StatMod by 4;
				now l_StatMod is l_StatMod divided by 4;
				let l_Acc be the remainder after dividing l_StatMod by 4;
				now l_StatMod is l_StatMod divided by 4;
				let l_Evd be the remainder after dividing l_StatMod by 4;
				let L be a list of texts;
				let Mag be 0;
				if l_PhAtt is greater than 0:
					now Mag is l_PhAtt;
					add "Physical Attack" to L;
				if l_SpAtt is greater than 0:
					if l_SpAtt is greater than Mag, now Mag is l_SpAtt;
					add "Special Attack" to L;
				if l_PhDef is greater than 0:
					if l_PhDef is greater than Mag, now Mag is l_PhDef;
					 add "Physical Defense" to L;
				if L_SpDef is greater than 0:
					if L_SpDef is greater than Mag, now Mag is L_SpDef;
		 			add "Physical Defense" to L;
				if l_Spd is greater than 0:
					if l_Spd is greater than Mag, now Mag is l_Spd;
					 add "Speed" to L;
				if l_Acc is greater than 0:
					if l_Acc is greater than Mag, now Mag is l_Acc;
		 			add "Accuracy" to L;
				if l_Evd is greater than 0:
					if l_Evd is greater than Mag, now Mag is l_Evd;
		 			add "Evasion" to L;
				if l_RaiseStat is false:
					now l_PhAtt is l_PhAtt times -1;
					now l_SpAtt is l_SpAtt times -1;
					now l_PhDef is l_PhDef times -1;
					now l_SpDef is l_SpDef times -1;
					now l_Spd is l_Spd times -1;
					now l_Acc is l_Acc times -1;
					now l_Evd is l_Evd times -1;
				let ModTarget be the active character;
				If l_SelfStat is false, now ModTarget is the Current Move Target;
				increase the PhysAttMod of ModTarget by l_phAtt;
				increase the SpecAttMod of ModTarget by l_SpAtt;
				increase the PhysDefMod of ModTarget by l_PhDef;
				increase the SpecDefMod of ModTarget by l_SpDef;
				increase the SpeedMod of ModTarget by l_Spd;
				increase the AccMod of ModTarget by l_Acc;
				increase the EvadeMod of ModTarget by l_Evd;
				say "[ModTarget]'s [L] [if l_RaiseStat is true]rose[otherwise]dropped[end if] by [Mag]!".

Part 8 - Handling Combat Rounds

A Pokemon has a number called InitiativeOrder, Priority.

Every turn during combat (This is the Combat Round Rule):
	if every player character is commanded:
		let L be the list of pokemon in the location;
		repeat with P running through L:
			now InitiativeOrder of P is the priority of P;
			now InitiativeOrder of P is InitiativeOrder of P times 10000;
			now InitiativeOrder of P is InitiativeOrder of P plus the effective speed of P;	
		sort L in reverse InitiativeOrder order;
		Long_say "Initiative: [L].";
		repeat with P running through L:
			now the active character is P;
			try the queued action of P;
		Carry out the performing end of round activity;
		Perform Enemy AI Routines;
		Now every player character is ready-for-orders;
		Now the active character is PC1;
		Say "[line break]== Starting Round [Current Combat Round] ==[line break]";
		announce lineup positioning.
		
Part 9 - The end of the combat round

Performing end of round is an activity.
Performing per-character round-end on something is an activity.

For performing end of round:
	increment Current Combat Round;
	
Before performing end of round (this is the initiate per-character round-end rule):
	Repeat with P running through the list of pokemon in the location:
		now the active character is P;
		Carry out the Performing per-character round-end on activity with P.
		
For performing per-character round-end on a burning thing (called P):
	unless P has working ability Heatproof:
		Say "[P] burns up a little bit!";
		Let N be the effective maximum hit points of P;
		Now N is N divided by 8;
		Deal N damage to P;
	Continue the activity.
		
For performing per-character round-end on an asleep thing (called P)(this is the sleep round-end rule):
	Decrement the Sleepcounter of p;
	if the sleepcounter of p is less than 1:
		say "[p] wakes up!";
	Continue the activity.
		
For performing per-character round-end on a poisoned thing (called P):
	if the StatusProblem of P is Psn:
		say "[P] dissolves a bit from poison!";
		let N be the effective maximum hit points of P;
		now N is N divided by 8;
		Deal N damage to P;
	if the StatusProblem of P is BadPsn:
		say "[P] dissolves from strong poison!";
		let N be the effective maximum hit points of P;
		now N is N times the BadPoisonCounter of P;
		now N is N divided by 16;
		Deal N damage to P;
		increment the BadPoisonCounter of P;
	Continue the activity.
		
			
To Perform Enemy AI Routines:
	Do nothing. [lol]

Part 10 -  Damage, Healing, and Fainting

To Deal (N - number) damage to (P - a pokemon):
	let HP be the Current Hit Points of P;
	let PreHP be HP;
	let MHP be the Effective Maximum Hit Points of P;
	decrease HP by N;
	now the current hit points of P is HP;
	say "[p] is damaged for [n] ([PreHP as a percentage of mhp] -> [HP as a percentage of mhp])[line break]";
	if HP is less than 1:
		Carry out the fainting activity with P;
		
To Heal (N - number) damage to/on (P - a pokemon):
	if P is fainted:
		say "[p] is unconscious and can't be healed normally!";
	otherwise:
		let HP be the Current Hit Points of P;
		let PreHP be HP;
		let MHP be the Effective Maximum Hit Points of P;
		increase HP by N;
		let dif be 0;
		if HP is greater than MHP:
			decrease N by HP - MHP;
			now HP is MHP;
		now the current hit points of P is HP;
		say "[p] is healed for [n] ([PreHP as a percentage of mhp] -> [HP as a percentage of mhp])[line break]";

to say (n - a number) as a percentage of (m - a number):
	let p be 1.0;
	now P is n;
	now p is p divided by m;
	now p is p times 100;
	now n is p to the nearest whole number;
	say "[n]%";

A Pokemon can be Conscious or Fainted. A pokemon is usually Conscious.
	
fainting something is an activity.

For fainting a pokemon (called P):
	say "[P] faints!";
	Now the Current Hit Points of P is 0;
	now P is fainted.

Part 11 - Announcement of moves

To say the move announcement of (PM - a pokemove):
	If PM is:
		-- Substitute: say "[active character] tosses down a substitute!";
		-- Otherwise: say "[Generic move announcement of PM]".
		
To say Generic move announcement of (PM - a pokemove):
	if the current move target is the active character:
		say "[active character] uses [the pokemove understood]!";
	Otherwise:
		say "[active character] uses [the pokemove understood] on [Current Move Target]!"

Part 12 - bullshit

changing the seed is an action applying to one number. Understand "seed [number]" as changing the seed.

carry out changing the seed:
	seed the random-number generator with the number understood;
	say "random seed changed to [number understood]."

bugtest_verbose is a truth state that varies. bugtest_verbose is false.

toggling verbose combat is an action out of world. Understand "verbose combat" as toggling verbose combat.

carry out toggling verbose combat:
	if bugtest_verbose is true:
		say "Disabling verbose combat.";
		now bugtest_verbose is false;
	otherwise:
		say "Enabling verbose combat.";
		now bugtest_verbose is true;
		
to long_say (T - text):
	if bugtest_verbose is true:
		say T;
		say line break.

transforming it into is an action applying to one thing and one pokespecies. Understand "Transform [something] into [pokespecies]" as transforming it into.

Carry out transforming it into:
	transmogrify the noun into the pokespecies understood.

To transmogrify (n - a pokemon) into (m - A PokeSpecies):
	now the pokespecies of n is m;
	now the first type of n is the firsttype of m;
	now the second type of n is the secondtype of m;
	now the third type of n is notype;
	now the current hit points of n is the effective maximum hit points of n;

Book 8 - Specific Move Rules

Include Specific Pokemon Move Rules by func_door.

Volume 2 - Game Setup

Include Dynamic Rooms by Aaron Reed.

There are 25 dynamic rooms.

The viable cave directions list is a list of objects that varies. The viable cave directions list is {north, east, west, south}.

The cave room names list is a list of texts that varies. The cave room names list is { "Passage", "Cavern", "Tunnel", "Hallway", "Maze", "Scramble", "Jumble" }.

Down from Test Chamber is Dungeon Entrance. The maximum-map-z is 0.

When play begins: locate Dungeon Entrance at xyz { 10, 0, 0 }

Daylit Passage is a room.

When play begins:
	let current room be Dungeon Entrance;
	let cave name be text;
	let new room be Dungeon Entrance;
	let dir be north;
	while available dynamic rooms > 5:
		now dir is entry (a random number from 1 to the number of entries in the viable cave directions list) in the viable cave directions list;
		while the room dir from current room is a room:
			now current room is the room dir from current room;
		now cave name is entry (a random number from 1 to the number of entries in cave room names list) in cave room names list;
		now new room is a newly created room dir of current room with name cave name;
		if a random chance of 1 in 3 succeeds, now current room is new room;
	change up exit of current room to Daylit Passage.
	
[Every Turn:
	Say "Obvious exits: ";
	repeat with D running through the viable cave directions list:
		if the room D from location is a room:
			say "[D] ".]

After going: now every Player Character is in the location.

Staging Area is a room.

PC1, PC2, PC3, PC4 are Player Characters in the Staging Area. The player is PC1.

PC1 has level 10. PC2 has level 10. PC3 has level 10. PC4 has level 10.

PC1 has linepos 1. PC2 has linepos 2. PC3 has linepos 3. PC4 has linepos 4.

When play begins:
	Repeat with n running through Pokemon:
		now the current hit points of n is the effective maximum hit points of n;

Volume 3 - Scenario

North of Staging Area is Test Chamber.

Alice is a monster in test chamber.
Bob is a monster in test chamber.
Carol is a monster in test chamber.
Dan is a monster in test chamber.

there are 100 monsters. there are 100 monsters. there are 100 monsters. there are 100 monsters. there are 36 monsters.

Standard Attack is a stored action that varies.

when play begins:
	Now Standard Attack is the action of using bite on nothing.

When play begins:
	repeat with P running through monsters:
		now the queued action of P is standard attack;
		now the actor part of the queued action of P is P;
		now the second noun part of the queued action of P is PC2;
	