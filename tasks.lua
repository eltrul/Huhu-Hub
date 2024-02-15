
    getgenv().Tasks = {}
    Tasks.__index = Tasks
    
    function Tasks.new(name,func,autoStart)
        local obj = {
            Name = name,
            Function = func,
            AutoContinueReq = autoStart or function() return false end
        }
        setmetatable(obj, Tasks)
        return obj
    end
    
    function Tasks:Stop() 
        if not self:IsRunning() then return end
        if self.Thread then 
            task.cancel(self.Thread)
        end
        if self.ForceStoped then 
            self.ForceStoped()
        end
    end
    function Tasks:Start() 
        if self:IsRunning() then return end
       
        self.Loop
        = task.spawn(function() 
          while wait(.4) do 
        --   print(self:IsRunning(), self.AutoContinueReq(), self.Name)
            if not self:IsRunning() then
            if self.AutoContinueReq() then 
              wait() 
              warn(1, self.Name)
              self.Thread = task.spawn(self.Function)
              else 
                self:Stop()
            end
            end
          end
        end)
       -- warn(2, self.Name)
        self.Thread = task.spawn(self.Function)
          
         
        return self
    end
    
    function Tasks:IsRunning() 
        if not self.Thread then return false end
        return coroutine.status(self.Thread) ~= "dead"
    end


if not getgenv().ListTask then 
    getgenv().ListTask = {}
end

local TaskHandler = {}

function TaskHandler:AddTask(Name, func, mm)
    ListTask[Name] = Tasks.new(name,func, mm)
    return ListTask[Name]
end

function TaskHandler:StopTask(Name)
    if not ListTask[Name] then return end
    ListTask[Name]:Stop()
end

function TaskHandler:CancelAll()
    for k, v in pairs(ListTask) do
        v:Stop()
    end 
      
     
end

function TaskHandler:GetRunningTasks(Config) 
  
  Config = Config or { Whitelist = {}}
  if type(Config.Whitelist) == "string" then 
    Config.Whitelist = {Config.Whitelist} 
  end 
  
  for i, v in pairs(ListTask) do 
    if v:IsRunning() and not Config.Whitelist[v] then 
      return v 
    end 
  end 
end

TaskHandler:CancelAll()
  
