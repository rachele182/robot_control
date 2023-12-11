%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FramesChainFromDH( DH_sym,q,Convention ) builds the kinematic chain of a    %
% robot given its D-H table.                                              %
% The format of the D-H table have to be as in the following example:     %
% D-H table format example:                                               %
%  joint type | d_i | theta_i | a_i  | alpha_i                            %
%       1     | d1  |    q1   |  0   |   pi/2                             %
%                                                                         %
% joint type: 1 'revolute', 2 'prismatic'                                 %
% Convention: 'classic' (default) | 'modified'                            %
%                                                                         %
%                                                                         %
%   Author: Alexander Oliva                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [ EEframe, framesChain ] = Chain_mod( DH_sym, q, x, y, z, Convention )

if nargin < 3
   Convention = 'classic';  % default 'classic D-H convention'
else
    if ~strcmp(Convention,'modified')  % 'modified D-H convention'
        Convention = 'classic';
    end
end

%framesChain = zeros(4,4,size(DH_sym,1));
framesChain = sym('fc', [4 4 size(DH_sym,1)]);
framesChain = subs(framesChain, framesChain(:,:,:), zeros(4,4,size(DH_sym,1)));
EEframe = sym('eefc', [4 4]);

if DH_sym(1,1) == 1 %(1 for revolute, 2 for prismatic joints)
   DH_sym(1,3) = DH_sym(1,3)+q(1);
elseif DH_sym(1,1) == 2
    DH_sym(1,2) = DH_sym(1,2)+q(1);
end

if strcmp(Convention,'classic')
    framesChain(:,:,1) =  [cos(DH_sym(1,3)), -cos(DH_sym(1,5))*sin(DH_sym(1,3)),  sin(DH_sym(1,5))*sin(DH_sym(1,3)),DH_sym(1,4)*cos(DH_sym(1,3));
                           sin(DH_sym(1,3)),  cos(DH_sym(1,5))*cos(DH_sym(1,3)), -sin(DH_sym(1,5))*cos(DH_sym(1,3)),DH_sym(1,4)*sin(DH_sym(1,3));
                                 0     ,            sin(DH_sym(1,5))   ,          cos(DH_sym(1,5))     ,     DH_sym(1,2)        ;
                                 0     ,                 0         ,              0            ,         1         ];
else
    framesChain(:,:,1) =  [     cos(DH_sym(1,3))        ,         -sin(DH_sym(1,3))     ,      0       ,      DH_sym(1,4);
                           cos(DH_sym(1,5))*sin(DH_sym(1,3)),  cos(DH_sym(1,5))*cos(DH_sym(1,3)), -sin(DH_sym(1,5)),-sin(DH_sym(1,5))*DH_sym(1,2);
                           sin(DH_sym(1,5))*sin(DH_sym(1,3)),  sin(DH_sym(1,5))*cos(DH_sym(1,3)), cos(DH_sym(1,5)) , cos(DH_sym(1,5))*DH_sym(1,2);
                                    0               ,                 0         ,      0       ,         1         ];
end

for i=2:size(DH_sym,1)
    if DH_sym(i,1) == 1 %(1 for revolute, 2 for prismatic joints)
       DH_sym(i,3) = DH_sym(i,3)+q(i);
    elseif DH_sym(i,1) == 2
        DH_sym(i,2) = DH_sym(i,2)+q(i);
    end
    
    if strcmp(Convention,'classic')
        framesChain(:,:,i) =  framesChain(:,:,i-1)*[cos(DH_sym(i,3)), -cos(DH_sym(i,5))*sin(DH_sym(i,3)),  sin(DH_sym(i,5))*sin(DH_sym(i,3)),DH_sym(i,4)*cos(DH_sym(i,3));
                                                    sin(DH_sym(i,3)),  cos(DH_sym(i,5))*cos(DH_sym(i,3)), -sin(DH_sym(i,5))*cos(DH_sym(i,3)),DH_sym(i,4)*sin(DH_sym(i,3));
                                                          0     ,            sin(DH_sym(i,5))   ,          cos(DH_sym(i,5))     ,     DH_sym(i,2)        ;
                                                          0     ,                 0         ,              0            ,         1         ];
    else
        framesChain(:,:,i) =  framesChain(:,:,i-1)*[     cos(DH_sym(i,3))        ,         -sin(DH_sym(i,3))     ,      0       ,      DH_sym(i,4);
                                                    cos(DH_sym(i,5))*sin(DH_sym(i,3)),  cos(DH_sym(i,5))*cos(DH_sym(i,3)), -sin(DH_sym(i,5)),-sin(DH_sym(i,5))*DH_sym(i,2);
                                                    sin(DH_sym(i,5))*sin(DH_sym(i,3)),  sin(DH_sym(i,5))*cos(DH_sym(i,3)), cos(DH_sym(i,5)) , cos(DH_sym(i,5))*DH_sym(i,2);
                                                             0               ,                 0         ,      0       ,         1         ];
    end
end

EEframe = framesChain(:,:,end)*[1 0 0 x; 0 1 0 y; 0 0 1 z; 0 0 0 1];

end