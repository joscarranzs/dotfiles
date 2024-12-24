-- Función para ejecutar comandos del sistema y capturar la salida
local function exec(cmd)
    local handle = io.popen(cmd)
    local result = handle:read("*a")
    handle:close()
    return result
end

-- Función para validar el acceso al repositorio remoto
local function validate_remote_access()
    local result = exec("git ls-remote")
    if result == "" then
        print("Error: No se puede acceder al repositorio remoto.")
        return false
    else
        print("Acceso al repositorio remoto validado.")
        return true
    end
end

-- Función para validar las últimas actualizaciones del repositorio remoto
local function validate_remote_updates()
    local result = exec("git pull")
    if result:find("Already up to date.") then
        print("El repositorio está actualizado.")
        return true
    elseif result == "" then
        print("Error: No se pudieron obtener las actualizaciones del repositorio remoto.")
        return false
    else
        print("Últimas actualizaciones del repositorio remoto integradas.")
        return true
    end
end

-- Función para agregar archivos al repositorio
local function add_files()
    local result = exec("git add .")
    if result == "" then
        print("Archivos agregados al repositorio.")
        return true
    else
        print("Error al agregar archivos al repositorio.")
        return false
    end
end

-- Función para hacer commit con la nomenclatura especificada
local function make_commit()
    local date = os.date("%Y-%m-%d %H:%M:%S")
    local commit_message = "Last update " .. date
    local result = exec('git commit -m "' .. commit_message .. '"')
    if result:find("nothing to commit") then
        print("No hay cambios para hacer commit.")
        return false
    elseif result == "" then
        print("Error al hacer commit.")
        return false
    else
        print("Commit realizado con el mensaje: " .. commit_message)
        return true
    end
end

-- Función para subir los cambios al repositorio remoto
local function push_changes()
    local result = exec("git push")
    if result == "" then
        print("Error al subir los cambios al repositorio remoto.")
        return false
    else
        print("Cambios subidos al repositorio remoto.")
        return true
    end
end

-- Verificar configuración remota
print("Configuración remota:")
print(exec("git remote -v"))

-- Probar conexión SSH
print("Probando conexión SSH:")
print(exec("ssh -T git@github.com"))

-- Ejecución del script
if validate_remote_access() and validate_remote_updates() and add_files() and make_commit() then
    push_changes()
end
