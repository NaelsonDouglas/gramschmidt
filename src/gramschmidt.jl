base = [1.0 0 0;0 1 1;0 1 2]


function projection(ui,gi)
	vec(dot(vec(ui),vec(gi))*gi)
end


function calculateV(ui,position,V,G)
	if (position == 1)
		return vec(ui)/norm(vec(ui))
	end

	v= vec(ui)
	for (i=1:position-1)
		v= v -  vec(projection(ui,vec(G[i,:])))
	end

	return v
end


function calculateG(vi)
	map((x)->x/norm(vi),vi)
end


function gramschimidt(b)
	base = float(b)
	G=zeros(base)
	V=zeros(base)	

	for(i=1:length(base[:,1]))
		V[i,:] = calculateV(base[i,:],i,V,G)
		G[i,:] = calculateG(V[i,:])
	end	
	return G
end













