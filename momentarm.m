import org.opensim.modeling.*
clear
model = Model("wrist.osim");
state = model.initSystem();

%Get Range of all Coordinates
cSet = model.getCoordinateSet();
nCoord = round(cSet.getSize());

for i = 0:nCoord-1
    if cSet.get(i).isDependent(state) == 0
        coordName(i+1,1) = cSet.get(i).getName();
        coord(i+1,1) = cSet.get(i).getRangeMin();
        coord(i+1,2) = cSet.get(i).getRangeMax();
    end
end

%generate iteration values
for i = 0:nCoord-1
    if cSet.get(i).isDependent(state) == 0
        ite{i+1} = coord(i+1,1):0.001:coord(i+1,2);
    end
end