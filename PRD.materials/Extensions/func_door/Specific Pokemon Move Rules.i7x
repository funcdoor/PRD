Specific Pokemon Move Rules by func_door begins here.

Chapter 1 - Roost

A pokemon has a truth state called cond_Roost.

After performing move effects while current move is Roost (this is the use Roost rule):
	if current move hits is true:
		let P be whether or not current move target is ungrounded;
		now the cond_Roost of current move target is true;
		let N be whether or not current move target is ungrounded;
		unless P is N:
			say "[current move target] lands to heal!";
definition: a pokemon is roosting if the cond_Roost of it is true.

for performing per-character round-end on a roosting thing (called P) (This is the unroost rule):
	now the cond_roost of P is false;
		
Chapter 2 - Smack Down

A pokemon has a truth state called cond_SmackDown.

After performing move effects while current move is Smack Down (this is the use SmackDown rule):
	if current move hits is true:
		let B be whether or not current move target is ungrounded;
		now the cond_smackdown of the current move target is true;
		let N be whether or not current move target is ungrounded;
		unless B is N:
			say "[current move target] is smacked down!"
		
definition: a pokemon is smackdowned if the cond_smackdown of it is true.

Chapter 3 - Telekinesis

After performing move effects while current move is Telekinesis (this is the use Telekinesis rule):
	if current move hits is true:
		let B be whether or not current move target is ungrounded;
		now the cond_MagnetRise of the current move target is 5; [cheating and using the same condition for both moves]
		let N be whether or not current move target is ungrounded;
		unless B is N:
			say "[current move target] lifts into the air!"

Chapter 4 - Magnet Rise

A pokemon has a number called cond_MagnetRise.

After performing move effects while current move is Magnet Rise (this is the use Magnet Rise rule):
	if current move hits is true:
		let B be whether or not current move target is ungrounded;
		now the cond_MagnetRise of the current move target is 5;
		let N be whether or not current move target is ungrounded;
		unless B is N:
			say "[current move target] lifts into the air!"
			
For performing per-character round-end on a magnetrisen thing (called P) (this is the decay magnetrise rule):
	let B be whether or not P is ungrounded;
	decrement cond_MagnetRise;
	let N be whether or not P is ungrounded;
	unless B is N:
		say "[P] lands back on the ground!"
		
definition: a pokemon is magnetrisen if the cond_MagnetRise of it is greater than 0.

Chapter 5 - Aqua Ring

A pokemon has a truth state called cond_AquaRing.

After performing move effects while current move is Aqua Ring (this is the use Aqua Ring rule):
	if current move hits is true:
		now the cond_AquaRing of the current move target is true;
		
definition: a pokemon is aquaringed if the cond_AquaRing of it is true.

For performing per-character round-end on an aquaringed thing (called P) (this is the Aqua Ring healing rule):
	let N be the effective maximum hit points of P;
	now N is N divided by 16;
	say "[active character] heals a bit from Aqua Ring!";
	heal N damage on P;

Chapter 6 - Ingrain

A pokemon has a truth state called cond_Ingrain.

After performing move effects while current move is Ingrain (this is the use Ingrain rule):
	if current move hits is true:
		now the cond_Ingrain of the current move target is true;
		
definition: a pokemon is ingrained if the cond_ingrain of it is true.
		
For performing per-character round-end on an ingrained thing (called P) (this is the ingrain healing rule):
	let N be the effective maximum hit points of P;
	now N is N divided by 16;
	say "[active character] heals a bit from Ingrain!";
	heal N damage on P;

Chapter 7 - Heal Block

A pokemon has a number called cond_HealBlock.

After performing move effects while current move is heal block (this is the use Heal Block rule):
	if current move hits is true:
		now the cond_HealBlock of the current move target is 5;
		
For performing per-character round-end on a healblocked thing (called P)(this is the decrement heal block counters rule):
	decrement the cond_HealBlock of p;
	Continue the activity.

Definition: A pokemon is healblocked if the cond_HealBlock of it is greater than 0.

the announce blocking leechmove rule substitutes for the standard drain move rule if the active character is healblocked.
the announce blocking healing rule substitutes for the do healing for healing moves rule if the current move target is healblocked.
the announce blocking healing rule substitutes for the do healing for Sunlight-dependent healing moves rule if the current move target is healblocked.
the the ingrain healing rule does nothing if the active character is healblocked.
the aqua ring healing rule does nothing if the active character is healblocked.

This is the announce blocking leechmove rule:
	if the leech of current move is greater than 0:
		Say "Heal Block prevents damage drain!";
	
This is the announce blocking healing rule:
	if current move hits is true:
		if the current move is listed in The list of healing moves or the current move is listed in the list of Sunlight-dependent healing moves:
			Say "Heal Block prevents healing!";

Chapter 8 - Leech Seed

A Pokemon has a truth state called cond_LeechSeed.

Check someone using leech seed on:
	if the cond_LeechSeed of the second noun is true:
		say "A Pokemon cannot have multiple leech seeds!";
		stop the action.
		
Check someone using leech seed on:
	if the second noun has the type GrassType:
		say "Grass types cannot be Leech Seeded!";
		stop the action.

After performing move effects while current move is Leech Seed (this is the use leech seed rule):
	if current move hits is true:
		now the cond_LeechSeed of the current move target is true;
		
For performing per-character round-end on a thing (called P):
	if current move hits is true and the cond_LeechSeed of P is true:
		let Position be the LinePos of P;
		Let MHP be the effective maximum hit points of P;
		let healtarget be nothing;
		let L be a list of things;
		Now L is the list of enemy pokemon in the location;
		Repeat with i running through L:
			if the linepos of i is Position:
				now healtarget is i;
				break;
		if healtarget is nothing:
			say "[P]'s Leech Seed had nothing to heal!";
		otherwise:
			let AMT be MHP / 8;
			say "[P] is harmed by its Leech Seed, healing [healtarget]!";
			Deal AMT damage to P;
			Heal AMT damage on healtarget;			

Chapter 9 - Substitute

A Pokemon has a number called cond_Substitute.

to decide if (p - a pokemon) has a/-- Substitute:
	if the cond_Substitute of p is greater than 1, decide yes;
	decide no.

Check using substitute on something:
	if the cond_substitute of the active character is greater than 0:
		say "You cannot have multiple substitutes!";
		stop the action.
		
After performing move effects (This is the use Substitute rule):
	If Current Move is Substitute and current move hits is true:
		let N be the current hit points of active character;
		Now n is n divided by 4;
		Deal n damage to active character;
		Increment n;
		Now the cond_substitute of active character is n.
		
For performing move effects while current move target has Substitute(this is the substitute blocks stuff rule):
	Say "[current move target]'s substitute takes a hit!";
	decrease the cond_Substitute of the current move target by Current Move Damage;
	Unless current move target has Substitute:
		say "[current move target]'s substitute breaks!";
	now current move hits is false.

Chapter 10 - Reflect and Light Screen

A Pokemon has a number called cond_LightScreen.
A Pokemon has a number called cond_Reflect.

To decide if (p - a pokemon) is affected by light screen:
	if the cond_LightScreen of p is greater than 0, decide yes;
	decide no.
	
To decide if (p - a pokemon) is affected by Reflect:
	if the cond_reflect of p is greater than 0, decide yes;
	decide no.

After performing move effects (This is the use Reflect rule):
	If current move is Reflect and current move hits is true:
		now the cond_reflect of current move target is 5;
		
After performing move effects (This is the use Light Screen rule):
	If current move is Light Screen and current move hits is true:
		now the cond_LightScreen of current move target is 5;
		
before performing per-character round-end on a thing (called P):
	if the cond_lightscreen of P is greater than 0:
		decrement the cond_lightscreen of p;
	if the cond_reflect of P is greater than 0:
		decrement the cond_reflect of p;

For performing per-character round-end on a thing (called P)(this is the decrement lightscreen and reflect counters rule):
	if the cond_lightscreen of P is greater than 0:
		decrement the cond_lightscreen of p;
	if the cond_reflect of P is greater than 0:
		decrement the cond_reflect of p;
	Continue the activity.

the last Before performing move effects (this is the light screen reduces special damage rule):
	if the mode of the current move is Special and the current move target is affected by light screen:
		let N be current move damage;
		now n is n divided by 3;
		decrease current move damage by n;
		say "Light screen reduced the damage!";
		
the last Before performing move effects (this is the reflect reduces physical damage rule):
	if the mode of the current move is physical and the current move target is affected by reflect:
		let N be current move damage;
		now n is n divided by 3;
		decrease current move damage by n;
		say "Reflect reduced the damage!";
		
Chapter 11 - Simple Healing Moves
	 	
The list of healing moves is always {Heal Order, Heal Pulse, Milk Drink, Recover, Slack Off, Soft-Boiled, Roost}.

After performing move effects (This is the do healing for healing moves rule):
	if the current move is listed in The list of healing moves AND current move hits is true:
		let H be the effective maximum hit points of the current move target;
		now H is H divided by 2;
		heal H damage to current move target;
		
chapter 12 - Sunlight-dependent healing moves

The list of Sunlight-dependent healing moves is always {Moonlight, Morning Sun, Synthesis}.

After performing move effects (This is the do healing for Sunlight-dependent healing moves rule):
	if the current move is listed in The list of Sunlight-dependent healing moves AND current move hits is true:
		let H be the effective maximum hit points of the current move target;
		if current weather is Sunlight:
			now H is H times 3;
			now H is H divided by 2;
			say "The sun enhanced the healing!";
		if current weather is clearSkies:
			now H is H divided by 2;
		otherwise:
			now H is H divided by 4;
			say "This weather is no good for [current move]!";
		heal H damage to current move target;

Chapter 13 - Recoil Moves

The list of recoil moves is always {Brave Bird, Double-Edge, Flare Blitz, Head Charge, Head Smash, Struggle, Submission, Take Down, Volt Tackle, Wild Charge, Wood Hammer}.

After performing move effects (This is the do recoil for recoil moves rule):
	if the current move is listed in The list of recoil moves AND current move hits is true:
		let H be the current move damage;
		let N be 1;
		if the current move is:
			-- Brave Bird: now N is 3;
			-- Double-Edge: now N is 3;
			-- Flare Blitz: now N is 3;
			-- Head Charge: now N is 4;
			-- Head Smash: Now N is 2;
			-- Struggle: Now n is 4;
			-- Submission: Now N is 4;
			-- Take Down: now N is 4;
			-- Volt Tackle: Now N is 3;
			-- Wild Charge: Now N is 4;
			-- Wood Hammer: Now N is 3;
		now H is H divided by N;
		say "[active character] takes 1/[n] recoil damage!";
		Deal H damage to the active character.

Chapter 14 - Toxic

Before Performing Move Effects while Current Move is Toxic (this is the Toxic Always Hits for Poison Types Rule):
	if the Active Character has the type PoisonType, now the Current Move Accuracy is 0.

Chapter 15 - Variable Power moves

Before performing move effects while current move is Hex (this is the Hex harms the inflicted rule):
	Unless the StatusProblem of the Current Move Target is NullStatus:
		now the current move power is the current move power times two;
		long_say "Hex's power doubles!".
		
Before performing move effects while current move is Venoshock (this is the Venoshock harms the envenomed rule):
	If the StatusProblem of the Current Move Target is Psn or the StatusProblem of the Current Move Target is badPsn:
		long_say "Venoshock's power doubles!";
		now the current move power is the current move power times two.
		
Before performing move effects while current move is Brine (this is the Brine harms the injured rule):
	let N be the effective maximum hit points of current move target;
	now N is N divided by 2;
	if the current hit points of current move target is less than N:
		now the current move power is the current move power times two;
		long_say "Brine's power doubles!";
		
Before performing move effects while current move is Smelling Salts (this is the smelling salts mercy rule):
	if the StatusProblem of the current move target is Paralys:
		now the statusproblem of the current move target is nullstatus;
		now the current move power is the current move power times two;
		say "[active character]'s Smelling Salts charges up by curing [current move target]'s Paralysis!"
		
Before performing move effects while current move is Wake-Up Slap (this is the wake-up slap wakes sleeping rule):
	if the StatusProblem of the current move target is Paralys:
		now the statusproblem of the current move target is nullstatus;
		now the current move power is the current move power times two;
		say "[active character]'s Wake-Up Slap charges up by waking up [current move target]!"
		
Before performing move effects while current move is Reversal or current move is flail (this is the flail reversal huskar rule):
	let P be 0;
	let N be the effective maximum hit points of active character;
	let M be the current hit points of active character;
	now M is M times 100;
	now M is M divided by N;
	if M is greater than 70:
		now P is 20;
	otherwise if P is greater than 35:
		now P is 40;
	otherwise if M is greater than 20:
		now P is 80;
	otherwise if M is greater than 10:
		now P is 100;
	otherwise if M is greater than 5:
		now P is 150;
		say "[current move] does nearly maximum damage!";
	otherwise:
		now P is 200;
		say "[current move] does maximum damage!"

Before performing move effects while current move is Facade:
	if the StatusProblem of the Active Character is burn or the StatusProblem of the Active Character is paralys or the StatusProblem of the Active Character is Psn or the StatusProblem of the Active Character is badPsn:
		now the current move power is the current move power times two;
		say "[active character]'s infliction grants them strength in battle!"
		
Before performing move effects while current move is Magnitude(this is the magnitude random power rule):
	let N be 0;
	if a random chance of 3 in 10 succeeds:
		now N is 70;
	otherwise if a random chance of 2 in 7 succeeds:
		now n is 50;
	otherwise if a random chance of 2 in 5 succeeds:
		now n is 90;
	otherwise if a random chance of 1 in 3 succeeds:
		now n is 30;
	otherwise if a random chance of 1 in 2 succeeds:
		now n is 110;
	otherwise if a random chance of 1 in 2 succeeds:
		now n is 10;
		say "Whammy!";
	otherwise:
		 now n is 150;
		say "Jackpot!";
	now the current move power is n.
		
Before performing move effects while current move is Stored Power:
	let N be the current move power;
	if the PhysAttMod of the active character is greater than 0, increase N by the PhysAttMod of the active character times 20;
	if the PhysAttMod of the active character is greater than 0, increase N by the PhysDefMod of the active character times 20;
	if the PhysAttMod of the active character is greater than 0, increase N by the SpecAttMod of the active character times 20;
	if the PhysAttMod of the active character is greater than 0, increase N by the SpecDefMod of the active character times 20;
	if the PhysAttMod of the active character is greater than 0, increase N by the SpeedMod of the active character times 20;
	if the PhysAttMod of the active character is greater than 0, increase N by the AccMod of the active character times 20;
	if the PhysAttMod of the active character is greater than 0, increase N by the EvadeMod of the active character times 20;
	long_say "Power increased to [N]!";
	now the current move power is n.
	
Before performing move effects while current move is Punishment:
	let N be the current move power;
	if the PhysAttMod of the current move target is greater than 0, increase N by the PhysAttMod of the current move target times 20;
	if the PhysDefMod of the current move target is greater than 0, increase N by the PhysDefMod of the current move target times 20;
	if the SpecAttMod of the current move target is greater than 0, increase N by the SpecAttMod of the current move target times 20;
	if the SpecDefMod of the current move target is greater than 0, increase N by the SpecDefMod of the current move target times 20;
	if the SpeedMod of the current move target is greater than 0, increase N by the SpeedMod of the current move target times 20;
	if N is greater than 200, now N is 200;
	long_say "Power increased to [N]!";
	now the current move power is n.
	
Before performing move effects while current move is Crush Grip or current move is Wring Out:
	let N be the current hit points of the current move target;
	now n is n times 120;
	now n is n divided by effective maximum hit points of current move target;
	increment n;
	long_say "[current move]'s power is [N]!";
	now the current move power is n.
	
Before performing move effects while current move is Electro Ball:
	let N be 0;
	let A be the effective speed of the active character;
	let D be the effective speed of the current move target;
	if A / 2 is less than D:
		now N is 60;
	otherwise if A / 3 is less than D:
		now N is 80;
	otherwise if A / 4 is less than D:
		now N is 120;
	otherwise:
		now N is 150;
	now the current move power is n.
	
Before performing move effects while current move is Gyro Ball:
	let N be the effective speed of the current move target times 25;
	now N is N / effective speed of the active character;
	if n is greater than 150, now n is 150;
	long_say "Gyro ball power is [N]!";
	now the current move power is n.

Before performing move effects while current move is Water Spout or current move is Eruption:
	let N be the current hit points of the active character;
	now N is N * 150;
	now N is N / the effective maximum hit points of the active character;
	if N is less than 1, now N is 1;
	long_say "[current move]'s power is [N]!";
	now the current move power is n.
	
Chapter 16 - Charge

A pokemon has a truth state called cond_Charge.

After performing move effects while current move is Charge (this is the use Charge rule):
	if current move hits is true:
		now the cond_Charge of current move target is True;
		say "[current move target] began charging power!"

Definition: A pokemon is Charged if the cond_Charge of it is true.		

The last before performing move effects while the active character is charged (this is the attacking with charge rule):
	if the current move type is ElectricType:
		now current move damage is current move damage times two;
		say "[active character]'s Charge was used to double the damage!";
	otherwise:
		say "[active character]'s Charge fizzles!";
	now the cond_Charge of active character is false.
	
Chapter 17 - Moves with a semi-evading charge-up turn

A pokemon has a truth state called cond_bounce, cond_dig, cond_dive, cond_fly, cond_SkyDrop, cond_SkyDrop_Targeted.

To decide if (P - pokemon) is preoccupied:
	if the cond_charge-up of P is true, decide yes;
	if the cond_bounce of P is true, decide yes;
	if the cond_dig of P is true, decide yes;
	if the cond_dive of P is true, decide yes;
	if the cond_fly of P is true, decide yes;
	if the cond_SkyDrop of P is true, decide yes;
	if the cond_SkyDrop_Targeted of P is true, decide yes;
	decide no.
	
To decide if (P - pokemon) is not preoccupied: [used by "Carry out using it on while the active character is not preoccupied during combat" rule]
	if P is preoccupied, decide no;
	decide yes.

After performing move effects while current move is bounce (this is the begin charge-up bounce rule):
	now the cond_bounce of active character is true;
	
After performing move effects while current move is dig (this is the begin charge-up dig rule):
	now the cond_dig of active character is true;
	
After performing move effects while current move is dive (this is the begin charge-up dive rule):
	now the cond_dive of active character is true;
	
After performing move effects while current move is fly (this is the begin charge-up fly rule):
	now the cond_fly of active character is true;
	
After performing move effects while current move is Sky Drop:
	now the cond_skydrop of active character is true;
	now the cond_SkyDrop_Targeted of current move target is true;
	
Before performing move effects while current move is perform_SkyDrop (this is the drop down with SkyDrop rule):
	now the cond_SkyDrop_Targeted of current move target is false;
	
Instead of doing something while the cond_bounce of active character is true during combat:
	let N be the second noun part of the queued action of the active character;
	now the queued action of the active character is the action of the active character using perform_bounce on nothing;
	now the second noun part of the queued action of the active character is N;
	now the cond_bounce of active character is false;
	now the active character is commanded;
	repeat with i running through ready-for-orders player characters:
		now the active character is i;
		break.

Instead of doing something while the cond_dig of active character is true during combat:
	let N be the second noun part of the queued action of the active character;
	now the queued action of the active character is the action of the active character using perform_dig on nothing;
	now the second noun part of the queued action of the active character is N;
	now the cond_dig of active character is false;
	now the active character is commanded;
	repeat with i running through ready-for-orders player characters:
		now the active character is i;
		break.

Instead of doing something while the cond_dive of active character is true during combat:
	let N be the second noun part of the queued action of the active character;
	now the queued action of the active character is the action of the active character using perform_dive on nothing;
	now the second noun part of the queued action of the active character is N;
	now the cond_dive of active character is false;
	now the active character is commanded;
	repeat with i running through ready-for-orders player characters:
		now the active character is i;
		break.

Instead of doing something while the cond_fly of active character is true during combat:
	let N be the second noun part of the queued action of the active character;
	now the queued action of the active character is the action of the active character using perform_fly on nothing;
	now the second noun part of the queued action of the active character is N;
	now the cond_fly of active character is false;
	now the active character is commanded;
	repeat with i running through ready-for-orders player characters:
		now the active character is i;
		break.

Instead of doing something while the cond_SkyDrop of active character is true during combat:
	let N be the second noun part of the queued action of the active character;
	now the queued action of the active character is the action of the active character using perform_SkyDrop on nothing;
	now the second noun part of the queued action of the active character is N;
	now the cond_SkyDrop of active character is false;
	now the active character is commanded;
	repeat with i running through ready-for-orders player characters:
		now the active character is i;
		break.
		
To decide if (P - a pokemon) is air-invuln:
	if the cond_bounce of P is true, decide yes;
	if the cond_fly of P is true, decide yes;
	if the cond_SkyDrop of P is true, decide yes;
	if the cond_SkyDrop_targeted of P is true, decide yes;
	decide no.

To decide if (P - a pokemon) is water-invuln:
	if the cond_dive of P is true, decide yes;
	decide no.

To decide if (P - a pokemon) is ground-invuln:
	if the cond_dig of P is true, decide yes;
	decide no.

The list of air semi-invulnerable weaknesses is always {Gust, Smack Down, Sky Uppercut, Thunder, Twister, Hurricane, perform_SkyDrop}.
The list of water semi-invulnerable weaknesses is always {Surf[, Whirlpool]}.
The list of ground semi-invulnerable weaknesses is always {Earthquake, Magnitude[, Fissure]}.

The last before performing move effects rule while current move target is air-invuln (this is the air semi-invulnerable rule):
	if current move is listed in the list of air semi-invulnerable weaknesses:
		say "[current move] manages to hit [current move target] in semi-invuln, doubling damage!";
		now current move damage is current move damage times two;
	otherwise:
		say "[current move target] is too high up to be hit!";
		now current move hits is false;

The last before performing move effects rule while current move target is water-invuln (this is the water semi-invulnerable rule):
	if current move is listed in the list of water semi-invulnerable weaknesses:
		say "[current move] manages to hit [current move target] in semi-invuln, doubling damage!";
		now current move damage is current move damage times two;
	otherwise:
		say "[current move target] is diving and can't be hit!";
		now current move hits is false;

The last before performing move effects rule while current move target is ground-invuln (this is the ground semi-invulnerable rule):
	if current move is listed in the list of ground semi-invulnerable weaknesses:
		say "[current move] manages to hit [current move target] in semi-invuln, doubling damage!";
		now current move damage is current move damage times two;
	otherwise:
		say "[current move target] is burrowing and can't be hit!";
		now current move hits is false;

Chapter 18 - Moves with a charge-up turn besides semi-evasion moves

The list of generic charge-up moves is always {Freeze Shock, Geomancy, Ice Burn, Razor Wind, Skull Bash, Sky Attack, Solar Beam}.

A pokemon has a truth state called cond_charge-up. a pokemon has a number called cond_charge-up_readyby.

Before performing move effects while current move is listed in the list of generic charge-up moves:
	if the cond_charge-up of active character is false:
		if current move is skull bash:
			say "[active character] lowers its head, increasing defense!";
			increment the SpecDefMod of active character;
		otherwise:
			say "[active character] gets ready to do a move!";
		unless (current move is Solar Beam and current weather is Sunlight):
			now current move hits is false;
			now the cond_charge-up of active character is true;
			now the cond_charge-up_readyby of active character is Current Combat Round plus 1; [this is basically only for razor wind, which isn't even a good move.]
	otherwise:
		if current combat round is at least the cond_charge-up_readyby of active character:
			long_say "current combat round [current combat round], cond_charge-up_readyby of active character [cond_charge-up_readyby of active character].";
			now the cond_charge-up of active character is false;
		otherwise:
			now current move hits is false;
		
Instead of doing something while the cond_charge-up of active character is true during combat:
	now the active character is commanded;
	repeat with i running through ready-for-orders player characters:
		now the active character is i;
		break.
		
Chapter 19 - Solar Beam

the last before performing move effects when current move is Solar Beam:
	if Current Weather is Sandstorm or Current Weather is Rain:
		now current move damage is current move damage / 2;
		say "the weather weakened Solar Beam!"
	
Chapter 20 - Growth

After performing move effects when current move is Growth:
	If current weather is sunlight:
		Increment the PhysAttMod of the active character;
		increment the SpecAttMod of the active character;
		say "[active character]'s attack stats are bolstered by the bright sun!"

Chapter 21 - Blizzard, Thunder & Hurricane

Before performing move effects when current move is Blizzard:
	if current weather is hailing:
		now current move accuracy is 0;
		
Before performing move effects when current move is Thunder or current move is Hurricane:
	if current weather is rain, now current move accuracy is 0;
	if current weather is sunlight, now current move accuracy is 50;

Before performing move effects when current move is Blizzard:
	if current weather is hailing:
		now current move accuracy is 0;

Chapter 22 - Curse

A pokemon has a truth state called cond_Curse.

After performing move effects when current move is Curse:
	if active character has the type GhostType:
		let H be the effective maximum hit points of active character;
		now H is H divided by 2;
		say "[active character] hurts itself to curse [current move target]!";
		deal H damage to active character;
	otherwise:
		increment the PhysAttMod of active character;
		increment the PhysDefMod of active character;
		decrement the SpeedMod of active character;
		
Definition: a pokemon is cursed if the cond_curse of it is true.
		
For performing per-character round-end on a cursed thing (called P)(this is the hurt the cursed rule):
	let H be the effective maximum hit points of P;
	now H is H divided by 4;
	say "[P] is hurt by its curse!";
	deal H damage to P;
	
Chapter 23 - Psych Up

After performing move effects when current move is Psych Up:
	now the PhysAttMod of the active character is the PhysAttMod of the current move target;
	now the PhysDefMod of the active character is the PhysDefMod of the current move target;
	now the SpecAttMod of the active character is the SpecAttMod of the current move target;
	now the SpecDefMod of the active character is the SpecDefMod of the current move target;
	now the SpeedMod of the active character is the SpeedMod of the current move target;
	now the AccMod of the active character is the AccMod of the current move target;
	now the EvadeMod of the active character is the EvadeMod of the current move target;
	say "[active character] copies the stat adjustments on [current move target]!"
	
Chapter 24 - Focus Energy

a pokemon has a truth state called cond_FocusEnergy.

Before performing move effects when the cond_focusenergy of the active character is true:
	increment Current Move CritChance;
	
After performing move effects when current move is Focus Energy:
	now the cond_focusenergy of the active character is true;
	
Chapter 25 - Mist

Cond_Mist is a number that varies.

After performing move effects when current move is Mist:
	now cond_Mist is 5;
	say "A mysterious mist protects the battlefield from stat modifications from enemy moves!"

Before Performing end of round:
	if cond_Mist is greater than 0, decrement cond_Mist.
	
The standard stat modifying rule does nothing when cond_mist is greater than 0.

Chapter 26 - Haze

After performing move effects when current move is Haze:
	now the PhysAttMod of the current move target is 0;
	now the PhysDefMod of the current move target is 0;
	now the SpecAttMod of the current move target is 0;
	now the SpecDefMod of the current move target is 0;
	now the SpeedMod of the current move target is 0;
	now the AccMod of the current move target is 0;
	now the EvadeMod of the current move target is 0;
	say "[current move target]'s stat modifications were reset by Haze!";
	
Chapter 27 - Belly Drum

After performing move effects when current move is Belly Drum:
	let H be the effective maximum hit points of active character;
	now H is H divided by 2;
	deal H damage to active character;
	now the PhysAttMod of active character is 6;	
	say "[active character] cut its own HP and maximized attack!"
	
Chapter 28 - Acupressure

After performing move effects when current move is Acupressure:
	let L be a list of numbers;
	unless the PhysAttMod of current move target is greater than 5, add 1 to L;
	unless the PhysDefMod of current move target is greater than 5, add 2 to L;
	unless the SpecAttMod of current move target is greater than 5, add 3 to L;
	unless the SpecDefMod of current move target is greater than 5, add 4 to L;
	unless the SpeedMod of current move target is greater than 5, add 5 to L;
	unless the AccMod of current move target is greater than 5, add 6 to L;
	unless the EvadeMod of current move target is greater than 5, add 7 to L;
	let N be entry (a random number between 1 and the number of entries in L) in L;
	if N is:
		-- 1:
			Say "[current move target]'s Physical Attack rose sharply!";
			increase the PhysAttMod of current move target by 2;
		-- 2:
			Say "[current move target]'s Physical Defense rose sharply!";
			increase the PhysDefMod of current move target by 2;
		-- 3:
			Say "[current move target]'s Special Attack rose sharply!";
			increase the SpecAttMod of current move target by 2;
		-- 4:	
			Say "[current move target]'s Special Defense rose sharply!";
			increase the SpecDefMod of current move target by 2;
		-- 5:	
			Say "[current move target]'s Speed rose sharply!";
			increase the SpeedMod of current move target by 2;
		-- 6:	
			Say "[current move target]'s Accuracy rose sharply!";
			increase the AccMod of current move target by 2;
		-- 7:	
			Say "[current move target]'s Evasion rose sharply!";
			increase the EvadeMod of current move target by 2;
	
Specific Pokemon Move Rules ends here.

