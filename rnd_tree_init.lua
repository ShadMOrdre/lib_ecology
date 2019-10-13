-- naturally growing trees
-- rnd, 2015

-- local TREE_SIZE = 20;
-- local TRUNK_SIZE = 4;
-- local BRANCH_LENGTH = 10.;

local TREE_SIZE = 40;
local TRUNK_SIZE = 5;
local BRANCH_LENGTH = 10;


minetest.register_node("lib_ecology:tree_worldtree", {
	description = "naturally growing tree",
	tiles = {"lib_ecology_tree_default_trunk.png"},
	is_ground_content = true,
	groups = {cracky=3, stone=1},
	drop = 'lib_ecology:tree_default_trunk',
	after_place_node = function(pos, placer, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos);
		meta:set_string("infotext","growth started");
		meta:set_int("life",TREE_SIZE);
		meta:set_int("branch",0);
	end
})


minetest.register_abm({
	nodenames = {"lib_ecology:tree_worldtree"},
	neighbors = {"air"},
	interval = 1.0,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		
		
		local meta = minetest.get_meta(pos);
		local life = meta:get_int("life");
		local branch = meta:get_int("branch");
		minetest.set_node(pos, {name = "lib_ecology:tree_default_trunk"});
		
		
		-- LEAVES 
		if life<=0 or (life<TREE_SIZE-TRUNK_SIZE and math.random(5)==1)  then  -- either end of growth or above trunk randomly
				local r;
				if life <=0 then r = math.random(2)+1; -- determine leaves region size
					else r = math.random(2);
				end
				
				local i,j,k
				for i=-r,r do
					for j=-r,r do
						for k = -r,r do
							local p = {x=pos.x+i,y=pos.y+j,z=pos.z+k};
							if minetest.get_node(p).name == "air" and math.random(3)==1 then
								minetest.set_node(p,{name="lib_ecology:tree_default_leaves"});
							end
						end
					end
				end				
		end
		if life<=0 then return end -- stop growth
		
		
		local above  = {x=pos.x,y=pos.y+1,z=pos.z};
		local nodename = minetest.get_node(above).name
		
		-- GROWTH
		if nodename == "air" or nodename == "lib_ecology:tree_default_leaves" then -- can we grow up
			
			if math.random(3)==1 then -- occasionaly change direction of growth a little
				above.x=above.x+math.random(3)-2;
				above.z=above.z+math.random(3)-2;
			end
			
			-- BRANCHING
			if (math.random(3)==1 or branch == 0) and life<TREE_SIZE-TRUNK_SIZE then -- not yet in branch
				
				local dir = {x=math.random(5)-3,y=math.random(2)-1,z=math.random(5)-3};
				--if math.random(2)==1 then dir.y=(math.random(3)-2) end -- occassionaly branch nonhorizontaly 
				local dirlen = math.sqrt(dir.x*dir.x+dir.y*dir.y+dir.z*dir.z);
				if dirlen == 0 then dirlen = 1 end;	dir.x=dir.x/dirlen; dir.y=dir.y/dirlen; dir.z=dir.z/dirlen; -- normalize
				
				local length = math.random(math.pow(life/TREE_SIZE,1.5)*BRANCH_LENGTH)+1; -- length of branch
				for i=1,length-1 do
					local p = {x=above.x+dir.x*i,y=above.y+dir.y*i,z=above.z+dir.z*i};
					nodename = minetest.get_node(p).name;
					if  nodename== "air" or nodename == "lib_ecology:tree_default_leaves" then
						minetest.set_node(p,{name="lib_ecology:tree_default_trunk"});
					end
				end
				local grow = {x=above.x+dir.x*length,y=above.y+dir.y*length,z=above.z+dir.z*length};
				minetest.set_node(grow,{name="lib_ecology:tree_worldtree"});
				meta = minetest.get_meta(grow);
				meta:set_int("life",life*math.pow(0.8,branch)-1);meta:set_int("branch",branch+length); -- remember that we branched
				meta:set_string("infotext","branch, life ".. life-1);
			
			end
	
			-- add new growing part
			minetest.set_node(above,{name="lib_ecology:tree_worldtree"});
			meta = minetest.get_meta(above);
			meta:set_int("life",life-1);meta:set_int("branch",branch); -- decrease life
			meta:set_string("infotext","growing, life ".. life-math.random(TREE_SIZE*0.25));
			
			 if branch==0 then -- make main trunk a bit thicker
				-- for i = -1,1 do
					-- for j = -1,1 do
						-- if math.random(4)==1 then
							minetest.set_node({x=pos.x+1,y=pos.y,z=pos.z},{name="lib_ecology:tree_default_trunk"});
							minetest.set_node({x=pos.x-1,y=pos.y,z=pos.z},{name="lib_ecology:tree_default_trunk"});
							minetest.set_node({x=pos.x,y=pos.y,z=pos.z+1},{name="lib_ecology:tree_default_trunk"});
							minetest.set_node({x=pos.x,y=pos.y,z=pos.z-1},{name="lib_ecology:tree_default_trunk"});
						-- end
					-- end
				-- end
				
			end
			
			
		end
		
	end,
})