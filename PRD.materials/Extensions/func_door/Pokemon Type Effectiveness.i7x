Pokemon Type Effectiveness by func_door begins here.

To decide what number is the type effectiveness of (m - a poketype) against (x - a poketype) and (y - a poketype):
	let a be the type effectiveness of m against x;
	let b be the type effectiveness of m against y;
	let q be a * b;
	now q is q divided by 8;
	decide on q.
	
To decide what number is the type effectiveness of (m - a poketype) against (x - a poketype) and (y - a poketype) and (y - a poketype):
	let a be the type effectiveness of m against x;
	let b be the type effectiveness of m against y;
	let c be the type effectiveness of m against y;
	let q be a * b * c;
	now q is q divided by 64;
	decide on q.

To decide what number is the type effectiveness of (m - a poketype) against (x - a poketype):
	if m is NormalType:
		if x is RockType, decide on 4;
		if x is SteelType, decide on 4;
	if m is FightingType:
		if x is NormalType, decide on 16;
		if x is RockType, decide on 16;
		if x is SteelType, decide on 16;
		if x is IceType, decide on 16;
		if x is DarkType, decide on 16;
		if x is FairyType, decide on 4;
		if x is PsychicType, decide on 4;
		if x is BugType, decide on 4;
		if x is PoisonType, decide on 4;
		if x is FlyingType, decide on 4;
	if m is FlyingType:
		if x is FightingType, decide on 16;
		if x is BugType, decide on 16;
		if x is GrassType, decide on 16;
		if x is RockType, decide on 4;
		if x is SteelType, decide on 4;
		if x is ElectricType, decide on 4;
	if m is PoisonType:
		if x is GrassType, decide on 16;
		if x is FairyType, decide on 16;
		if x is PoisonType, decide on 4;
		if x is GroundType, decide on 4;
		if x is RockType, decide on 4;
		if x is GhostType, decide on 4;
	if m is GroundType:
		if x is PoisonType, decide on 16;
		if x is RockType, decide on 16;
		if x is SteelType, decide on 16;
		if x is FireType, decide on 16;
		if x is ElectricType, decide on 16;
		if x is BugType, decide on 4;
		if x is GrassType, decide on 4;
	if m is RockType:
		if x is FlyingType, decide on 16;
		if x is BugType, decide on 16;
		if x is FireType, decide on 16;
		if x is IceType, decide on 16;
		if x is FightingType, decide on 4;
		if x is GroundType, decide on 4;
		if x is SteelType, decide on 4;
	if m is BugType:
		if x is GrassType,decide on 16;
		if x is PsychicType, decide on 16;
		if x is DarkType, decide on 16;
		if x is FightingType, decide on 4;
		if x is FlyingType, decide on 4;
		if x is PoisonType, decide on 4;
		if x is GhostType, decide on 4;
		if x is SteelType, decide on 4;
		if x is FireType, decide on 4;
		if x is FairyType, decide on 4;
	if m is GhostType:
		if x is GhostType, decide on 16;
		if x is PsychicType, decide on 16;
		if x is DarkType, decide on 4;
	if m is SteelType:
		if x is RockType, decide on 16;
		if x is IceType, decide on 16;
		if x is FairyType, decide on 16;
		if x is SteelType, decide on 4;
		if x is FireType, decide on 4;
		if x is WaterType, decide on 4;
		if x is ElectricType, decide on 4;
	if m is FireType:
		if x is BugType, decide on 16;
		if x is SteelType, decide on 16;
		if x is GrassType, decide on 16;
		if x is IceType, decide on 16;
		if x is RockType, decide on 4;
		if x is FireType, decide on 4;
		if x is WaterType, decide on 4;
		if x is DragonType, decide on 4;
	if m is WaterType:
		if x is GroundType, decide on 16;
		if x is RockType, decide on 16;
		if x is FireType, decide on 16;
		if x is WaterType, decide on 4;
		if x is GrassType, decide on 4;
		if x is DragonType, decide on 4;
	if m is GrassType:
		if x is GroundType, decide on 16;
		if x is RockType, decide on 16;
		if x is WaterType, decide on 16;
		if x is FlyingType, decide on 4;
		if x is PoisonType, decide on 4;
		if x is BugType, decide on 4;
		if x is SteelType, decide on 4;
		if x is FireType, decide on 4;
		if x is FireType, decide on 4;
		if x is GrassType, decide on 4;
		if x is DragonType, decide on 4;
	if m is ElectricType:
		if x is FlyingType, decide on 16;
		if x is WaterType, decide on 16;
		if x is GrassType, decide on 4;
		if x is ElectricType, decide on 4;
		if x is DragonType, decide on 4;
	if m is PsychicType:
		if x is FightingType, decide on 16;
		if x is PoisonType, decide on 16;
		if x is SteelType, decide on 4;
		if x is PsychicType, decide on 4;
	if m is IceType:
		if x is FlyingType, decide on 16;
		if x is GroundType, decide on 16;
		if x is GrassType, decide on 16;
		if x is DragonType, decide on 16;
		if x is SteelType, decide on 4;
		if x is FireType, decide on 4;
		if x is WaterType, decide on 4;
		if x is IceType, decide on 4;
	if m is DragonType:
		if x is DragonType, decide on 16;
		if x is SteelType, decide on 4;
	if m is DarkType:
		if x is GhostType, decide on 16;
		if x is PsychicType, decide on 16;
		if x is FightingType, decide on 4;
		if x is DarkType, decide on 4;
		if x is FairyType, decide on 4;
	if m is FairyType:
		if x is FightingType, decide on 4;
		if x is DragonType, decide on 16;
		if x is DarkType, decide on 16;
		if x is PoisonType, decide on 4;
		if x is SteelType, decide on 4;
		if x is FireType, decide on 4;
	Decide on 8.

Pokemon Type Effectiveness ends here.
