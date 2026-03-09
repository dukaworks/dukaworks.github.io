@echo off
chcp 65001 >nul
echo ==========================================
echo  同步 Obsidian 文章到 Hexo
echo ==========================================
echo.

echo [1/3] 检查目录...
if not exist "..\_posts\" (
    echo 错误：找不到 Hexo _posts 目录！
    pause
    exit /b 1
)

echo [2/3] 同步发布文章...
xcopy /Y /E "_posts\*.md" "..\_posts\"
if errorlevel 1 (
    echo 警告：同步过程中出现错误
) else (
    echo 发布文章同步完成！
)

echo.
echo [3/3] 同步草稿（可选）...
echo 是否同步草稿到 Hexo _drafts？
choice /C YN /M "请选择"
if errorlevel 2 goto skip_drafts
if errorlevel 1 (
    xcopy /Y /E "_drafts\*.md" "..\_drafts\"
    echo 草稿同步完成！
)
:skip_drafts

echo.
echo ==========================================
echo  同步完成！
echo ==========================================
echo.
echo 下一步：
echo   cd ../..
echo   hexo clean ^&^& hexo g ^&^& hexo s
echo.
pause
