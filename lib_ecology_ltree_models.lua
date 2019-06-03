lib_ecology.acacia_model={
	axiom="FFFFFFccccA",
	rules_a = "[B]//[B]//[B]//[B]",
	rules_b = "&TTTT&TT^^G&&----GGGGGG++GGG++"	-- line up with the "canvas" edge
			.."fffffffGG++G++"					-- first layer, drawn in a zig-zag raster pattern
			.."Gffffffff--G--"
			.."ffffffffG++G++"
			.."fffffffff--G--"
			.."fffffffff++G++"
			.."fffffffff--G--"
			.."ffffffffG++G++"
			.."Gffffffff--G--"
			.."fffffffGG"
			.."^^G&&----GGGGGGG++GGGGGG++"		-- re-align to second layer canvas edge
			.."ffffGGG++G++"					-- second layer
			.."GGfffff--G--"
			.."ffffffG++G++"
			.."fffffff--G--"
			.."ffffffG++G++"
			.."GGfffff--G--"
			.."ffffGGG",
	rules_c = "/",
	trunk="lib_ecology:tree_acacia_trunk",
	leaves="lib_ecology:tree_acacia_leaves",
	angle=45,
	iterations=3,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
}

lib_ecology.apple_tree_model={
	axiom="FFFFFAFFBF",
	rules_a="[&&&FFFFF&&FFFF][&&&++++FFFFF&&FFFF][&&&----FFFFF&&FFFF]",
	rules_b="[&&&++FFFFF&&FFFF][&&&--FFFFF&&FFFF][&&&------FFFFF&&FFFF]",
	trunk="lib_ecology:tree_apple_trunk",
	leaves="lib_ecology:tree_apple_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
	fruit="default:apple",
	fruit_chance=15,
}

lib_ecology.beech_model={
	axiom="FFFFFBFB",
	rules_a="[&&&GGF[++^Fd][--&Fd]//Fd[+^Fd][--&Fd]]////[&&&GGF[++^Fd][--&Fd]//Fd[+^Fd][--&Fd]]////[&&&GGF[++^Fd][--&Fd]//Fd[+^Fd][--&Fdd]]",
	rules_b="[&&&F[++^Fd][--&d]//d[+^d][--&d]]////[&&&F[++^Fd][--&d]//d[+^d][--&d]]////[&&&F[++^Fd][--&Fd]//d[+^d][--&d]]",
	rules_c="/",
	rules_d="F",
	trunk="lib_ecology:tree_beech_trunk",
	leaves="lib_ecology:tree_beech_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true
}

lib_ecology.birch_model1={
	axiom="FFFFFdddccA/FFFFFFcA/FFFFFFcB",
	rules_a="[&&&dddd^^ddddddd][&&&---dddd^^ddddddd][&&&+++dddd^^ddddddd][&&&++++++dddd^^ddddddd]",
	rules_b="[&&&ddd^^ddddd][&&&---ddd^^ddddd][&&&+++ddd^^ddddd][&&&++++++ddd^^ddddd]",
	rules_c="/",
	rules_d="F",
	trunk="lib_ecology:tree_birch_01_trunk",
	leaves="lib_ecology:tree_birch_01_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true
}

lib_ecology.birch_model2={
	axiom="FFFdddccA/FFFFFccA/FFFFFccB",
	rules_a="[&&&dFFF^^FFFdd][&&&---dFFF^^FFFdd][&&&+++dFFF^^FFFdd][&&&++++++dFFF^^FFFdd]",
	rules_b="[&&&dFF^^FFFd][&&&---dFFF^^FFFd][&&&+++dFF^^FFFd][&&&++++++dFF^^FFFd]",
	rules_c="/",
	rules_d="F",
	trunk="lib_ecology:tree_birch_01_trunk",
	leaves="lib_ecology:tree_birch_01_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true
}

lib_ecology.cedar_model={
	axiom="FFFFFcccdddB///cFdFB////cFdFB///cFdFB///cFdFA///cFdFA///cFdFB[FF]f",
	rules_a="[&&&TTTT[++^TFdd][--&TFd]//Tdd[+^Fd][--&Fdd]]",
	rules_b="[&&&TTT[++^Fdd][--&Fdd]//dd[+^d][--&Fd]]",
	rules_c="/",
	rules_d="F",
	trunk="lib_ecology:tree_cedar_trunk",
	leaves="lib_ecology:tree_cedar_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
	fruit="lib_ecology:fruit_cedar_cone",
	fruit_chance=8
}

lib_ecology.date_palm_model={
	axiom="TTTTddddddddddccccccccccRT[TGGGGT]"..
		"ccccc[&&a]ccccc[&&a]ccccc[&&a]ccccc[&&a]ccccc[&&a]ccccc[&&a]"..
		"GGccccc[&a]ccccc[&a]ccccc[&a]ccccc[&a]ccccc[&a]ccccc[&a]"..
		"GGccccc[a]ccccc[a]ccccc[a]ccccc[a]ccccc[a]ccccc[a]",
	rules_a="Gffb&bbb[++f--&ffff&ff][--f++&ffff&ff]&ff&ff&bb&bb&bb",
	rules_b="f",
	rules_c="/",
	rules_d="F",
	trunk="lib_ecology:tree_date_palm_trunk",
	leaves="lib_ecology:tree_date_palm_leaves",
	angle=18,
	iterations=1,
	random_level=0,
	trunk_type="single",
	thin_branches=false,
	fruit="lib_ecology:fruit_dates",
	fruit_chance=0
}

lib_ecology.fir_model={
	axiom="FFFAF[&&-F][&&+F][&&---F][&&+++F]Fff",
	rules_a=nil,
	rules_b=nil,
	trunk="lib_ecology:tree_fir_trunk",
	leaves="lib_ecology:tree_fir_leaves",
	angle=45,
	iterations=7,
	random_level=5,
	trunk_type="single",
	thin_branches=true,
	fruit="lib_ecology:fruit_fir_cone",
	fruit_chance=8
}

lib_ecology.jungletree_model={
	axiom=nil,
	rules_a=nil,
	rules_b=nil,
	trunk="lib_ecology:tree_jungle_01_trunk",
	leaves="lib_ecology:tree_jungle_01_leaves",
	leaves2=nil,
	leaves2_chance=nil,
	angle=45,
	iterations=nil,
	random_level=2,
	trunk_type=nil,
	thin_branches=true,
	fruit_chance=15,
	fruit="vines:vine"
}

lib_ecology.oak_model={
	axiom="FFFFFFA",
	rules_a="[&FFBFA]////[&BFFFA]////[&FBFFA]",
	rules_b="[&FFFA]////[&FFFA]////[&FFFA]",
	trunk="lib_ecology:tree_oak_trunk",
	leaves="lib_ecology:tree_oak_leaves",
	angle=30,
	iterations=5,
	random_level=2,
	trunk_type="crossed",
	thin_branches=false,
	fruit="lib_ecology:fruit_acorn",
	fruit_chance=3,
}

lib_ecology.palm_model={
	axiom="FFcccccc&FFFFFdddRA//A//A//A//A//A",
	rules_a="[&fb&bbb[++f--&ffff&ff][--f++&ffff&ff]&ffff&bbbb&b]",
	rules_b="f",
	rules_c="/",
	rules_d="F",
	trunk="lib_ecology:tree_palm_01_trunk",
	leaves="lib_ecology:tree_palm_01_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
	fruit="lib_ecology:fruit_coconut",
	fruit_chance=0
}

lib_ecology.palm2_model={
	axiom="FFcccccc&FFFFFddd[^&&&GR][^///&&&GR][^//////&&&GR][^***&&&GR]FA//A//A//A//A//A",
	rules_a="[&fb&bbb[++f--&ffff&ff][--f++&ffff&ff]&ffff&bbbb&b]",
	rules_b="f",
	rules_c="/",
	rules_d="F",
	trunk="lib_ecology:tree_palm_01_trunk",
	leaves="lib_ecology:tree_palm_01_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
	fruit="lib_ecology:fruit_coconut",
	fruit_chance=0
}

lib_ecology.pine_model={
	axiom="FFFFFcccdddB///cFdFB////cFdFB///cFdFB///cFdFA///cFdFA///cFdFB[FF]f",
	rules_a="[&&&TTTT[++^TFdd][--&TFd]//Tdd[+^Fd][--&Fdd]]",
	rules_b="[&&&TTT[++^Fdd][--&Fdd]//dd[+^d][--&Fd]]",
	rules_c="/",
	rules_d="F",
	trunk="lib_ecology:tree_pine_02_trunk",
	leaves="lib_ecology:tree_pine_02_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="single",
	thin_branches=true,
	fruit="lib_ecology:fruit_pine_cone",
	fruit_chance=8
}

lib_ecology.poplar_model={
	axiom="TTTaaBCCCCCCCCCCCcccBBB[[f]&&G++f++Gf++Gf++Gf++G--]G[[f]&&G++f++Gf++Gf++Gf++G--]Gff",
	rules_a="T",
	rules_b="[[T]&&G++f++ff++ff++ff++f--]G",
	rules_c="[[T]&&G++f++ff++ff++ff++f--G++[d]G[d]G++G[d]G[d]G[d]G++G[d]G[d]G[d]G++G[d]G[d]G[d]G++G[d]G]G",
	rules_d="f",
	trunk="air",
	trunk="lib_ecology:tree_poplar_trunk",
	leaves="lib_ecology:tree_poplar_leaves",
	angle=45,
	iterations=0,
	random_level=0,
	trunk_type="single",
	thin_branches=false,
}

lib_ecology.poplar_small_model={
	axiom="TT[T]BCCCCccBBff",
	rules_a="T",
	rules_b="[[f]&&G++f++Gf++Gf++Gf++G--]G",
	rules_c="[[T]&&G++f++[d]Gf++[d]Gf++[d]Gf++[d]G--]G",
	rules_d="f",
	trunk="lib_ecology:tree_poplar_trunk",
	leaves="lib_ecology:tree_poplar_leaves",
	angle=45,
	iterations=0,
	random_level=0,
	trunk_type="single",
	thin_branches=false,
}

lib_ecology.rubber_tree_model={
	axiom="FFFFA",
	rules_a="[&FFBFA]////[&BFFFA]////[&FBFFA]",
	rules_b="[&FFA]////[&FFA]////[&FFA]",
	trunk="lib_ecology:tree_rubber_trunk",
	leaves="lib_ecology:tree_rubber_leaves",
	angle=35,
	iterations=3,
	random_level=1,
	trunk_type="double",
	thin_branches=true
}

lib_ecology.sequoia_model={
	axiom="FFFFFFFFFFddccA///cccFddcFA///ddFcFA/cFFddFcdBddd/A/ccdcddd/ccAddddcFBcccAccFdFcFBcccc/BFdFFcFFdcccc/B",
	rules_a="[&&&GGF[++^FFdd][--&Fddd]//Fdd[+^Fd][--&Fdd]]////[&&&GGF[++^FFdd][--&Fddd]//Fdd[+^Fd][--&Fdd]]////[&&&GGF[++^FFdd][--&Fddd]//Fdd[+^Fd][--&Fdd]]",
	rules_b="[&&&GGF[++^Fdd][--&Fdd]//dd[+^d][--&Fd]]////[&&&GGF[++^Fdd][--&Fdd]//dd[+^d][--&Fd]]////[&&&GGF[++^Fdd][--&Fdd]//dd[+^d][--&Fd]]",
	rules_c="/",
	rules_d="F",
	trunk="lib_ecology:tree_sequoia_trunk",
	leaves="lib_ecology:tree_sequoia_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="crossed",
	thin_branches=true
}

lib_ecology.spruce_model1={
	axiom="FFFFFAFFFFFFBFFFFFFCFFFFFFDFFFFFF[&&&F^^FF][&&&++F^^FF][&&&++++F^^FF][&&&++++++F^^FF][&&&--F^^FF][&&&----F^^FF][FFFFf]",
	rules_a="[&&&FFFFFF^^FFF][&&&++FFFFFF^^FFF][&&&++++FFFFFF^^FFF][&&&++++++FFFFFF^^FFF][&&&--FFFFFF^^FFF][&&&----FFFFFF^^FFF]",
	rules_b="[&&&FFFFF^^FFF][&&&++FFFFF^^FFF][&&&++++FFFFF^^FFF][&&&++++++FFFFF^^FFF][&&&--FFFFF^^FFF][&&&----FFFFF^^FFF]",
	rules_c="[&&&FFFF^^FFF][&&&++FFFF^^FFF][&&&++++FFFF^^FFF][&&&++++++FFFF^^FFF][&&&--FFFF^^FFF][&&&----FFFF^^FFF]",
	rules_d="[&&&FFF^^FFF][&&&++FFF^^FFF][&&&++++FFF^^FFF][&&&++++++FFF^^FFF][&&&--FFF^^FFF][&&&----FFF^^FFF]",
	trunk="lib_ecology:tree_spruce_trunk",
	leaves="lib_ecology:tree_spruce_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="crossed",
	thin_branches=true,
	fruit="lib_ecology:fruit_spruce_cone",
	fruit_chance=8
}

lib_ecology.spruce_model2={
	axiom="FFFFFFBFFFFFFCFFFFFFDFFFFFF[&&&F^^FF][&&&++F^^FF][&&&++++F^^FF][&&&++++++F^^FF][&&&--F^^FF][&&&----F^^FF][FFFFf]",
	rules_b="[&&&FFFFF^^FFF][&&&++FFFFF^^FFF][&&&++++FFFFF^^FFF][&&&++++++FFFFF^^FFF][&&&--FFFFF^^FFF][&&&----FFFFF^^FFF]",
	rules_c="[&&&FFFF^^FFF][&&&++FFFF^^FFF][&&&++++FFFF^^FFF][&&&++++++FFFF^^FFF][&&&--FFFF^^FFF][&&&----FFFF^^FFF]",
	rules_d="[&&&FFF^^FFF][&&&++FFF^^FFF][&&&++++FFF^^FFF][&&&++++++FFF^^FFF][&&&--FFF^^FFF][&&&----FFF^^FFF]",
	trunk="lib_ecology:tree_spruce_trunk",
	leaves="lib_ecology:tree_spruce_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="crossed",
	thin_branches=true,
	fruit="lib_ecology:fruit_spruce_cone",
	fruit_chance=8
}

lib_ecology.willow_model={
	axiom="FFFFFFFFccA",
	rules_a="[&FF&FFFF&&F&FFFFFFFdddd][**&FF&FFFF&&F&FFFFFFFdddd][//&FF&FFFF&&F&FFFFFFFdddd][////&FF&FFFF&&F&FFFFFFFdddd][//////&FF&FFFF&&F&FFFFFFFdddd][////////&FF&FFFF&&F&FFFFFFFdddd]",
	rules_c="/",
	rules_d="F",
	trunk="lib_ecology:tree_willow_02_trunk",
	leaves="lib_ecology:tree_willow_02_leaves",
	angle=30,
	iterations=2,
	random_level=0,
	trunk_type="crossed",
	thin_branches=true
}



-- Dates can't be generated as fruit, because there is no support for the
-- special (male and female) fruit trunks that allow dates to regrow at the
-- correct position in the tree.
-- So, a generic fruit trunk is spawned. An ABM will convert it to a male
-- or female fruit trunk, and generate the actual dates.

-- Coconuts can't be generated as fruit, because there is no support for the
-- special fruit trunks that allow coconuts to regrow at the correct position
-- in the tree.
-- So, a placeholder fruit trunk is spawned. An ABM will convert it to the final
-- fruit trunk, and generate the actual coconuts.

