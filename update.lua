-- Función para ejecutar comandos del sistema y capturar la salida
local function exec(cmd)
    local handle = io.popen(cmd .. " 2>&1")  -- Redirigir la salida de error estándar a la salida estándar
    local result = handle:read("*a")
    local success, _, exitcode = handle:close()
    return result, success, exitcode
end

-- Función para validar el acceso al repositorio remoto
local function validate_remote_access()
    local result, success, exitcode = exec("git ls-remote")
    if not success then
        print("Error: No se puede acceder al repositorio remoto. Código de salida: " .. exitcode)
        print(result)
        return false
    else
        print("Acceso al repositorio remoto validado.")
        return true
    end
end

-- Función para validar las últimas actualizaciones del repositorio remoto
local function validate_remote_updates()
    local result, success, exitcode = exec("git pull")
    if not success then
        print("Error: No se pudieron obtener las actualizaciones del repositorio remoto. Código de salida: " .. exitcode)
        print(result)
        return false
    else
        print("Últimas actualizaciones del repositorio remoto integradas.")
        return true
    end
end

-- Función para agregar archivos al repositorio
local function add_files()
    local result, success, exitcode = exec("git add .")
    if not success then
        print("Error al agregar archivos al repositorio. Código de salida: " .. exitcode)
        print(result)
        return false
    else
        print("Archivos agregados al repositorio.")
        return true
    end
end

-- Función para hacer commit con la nomenclatura especificada
local function make_commit()
    local date = os.date("%Y-%m-%d %H:%M:%S")
    local commit_message = "Last update " .. date
    local result, success, exitcode = exec('git commit -m "' .. commit_message .. '"')
    if result:find("nothing to commit") then
        print("No hay cambios para hacer commit.")
        return false
    elseif not success then
        print("Error al hacer commit. Código de salida: " .. exitcode)
        print(result)
        return false
    else
        print("Commit realizado con el mensaje: " .. commit_message)
        return true
    end
end

-- Función para subir los cambios al repositorio remoto
local function push_changes()
    local result, success, exitcode = exec("git push")
    if not success then
        print("Error al subir los cambios al repositorio remoto. Código de salida: " .. exitcode)
        print(result)
        return false
    else
        print("Cambios subidos al repositorio remoto.")
        return true
    end
end

-- Ejecución del script
if validate_remote_access() and validate_remote_updates() and add_files() and make_commit() then
    push_changes()
end
