

classdef ICtMpcOp < CtMpcOp
%CtMpcOP Continuous-time Model Predictive Control Optimization Problem
%
%   See help MpcOP for more info
%
%   See also MpcOP, DtMpcOp

    % This file is part of VirtualArena.
    %
    % Copyright (C) 2012-14 Andrea Alessandretti
    %
    % andrea.alessandretti@{ist.utl.pt, epfl.ch}
    % Automatic Control Laboratory, EPFL, Lausanne, Switzerland.
    % Institute System and Robotics, IST, Lisbon, Portugal.
    % 
    % This program is free software: you can redistribute it and/or modify
    % it under the terms of the GNU General Public License as published by
    % the Free Software Foundation, either version 3 of the License, or
    % (at your option) any later version.
    % 
    % This program is distributed in the hope that it will be useful,
    % but WITHOUT ANY WARRANTY; without even the implied warranty of
    % MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    % GNU General Public License for more details.
    % 
    % You should have received a copy of the GNU General Public License
    % along with this program.  If not, see <http://www.gnu.org/licenses/>.
    


    properties
        StageCostFnc
        TerminalCostFnc
    end
    
    methods
        
        function obj = ICtMpcOp(varargin)
            
            obj = obj@CtMpcOp(varargin{:});
            
            parameterPointer = 1;
            
            hasParameters = length(varargin)-parameterPointer>=0;
            
            while hasParameters
                
                if (ischar(varargin{parameterPointer}))
                    
                    switch varargin{parameterPointer}
                        
                          case 'StageCost'
                            
                            obj.StageCostFnc = varargin{parameterPointer+1};
                            
                            parameterPointer = parameterPointer+2;
                            
                          case 'TerminalCost'
                              
                             obj.TerminalCostFnc = varargin{parameterPointer+1};
                            
                            parameterPointer = parameterPointer+2;
                            
                            
                        otherwise
                            
                            parameterPointer = parameterPointer+1;
                            
                    end
                else
                    parameterPointer = parameterPointer+1;
                end
                
                hasParameters = length(varargin)-parameterPointer>=0;
                
            end
            
        end
        
        function l = stageCost(obj,varargin)
            
            if not(isempty(obj.StageCostFnc))
                l = obj.StageCostFnc(varargin{:});
            else
                l=0;
            end
        end
        
        function m = terminalCost(obj,varargin)
            if not(isempty(obj.TerminalCostFnc))
                m = obj.TerminalCostFnc(varargin{:});
            else
                m=0;
            end
            
        end
        
    end
end