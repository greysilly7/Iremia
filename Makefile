curseforge:
	@echo "Making Curseforge pack"
	packwiz curseforge export --pack-file .minecraft/pack.toml -o ../iremia-curseforge.zip
	7z d ../iremia-curseforge.zip overrides/packwiz-installer-bootstrap.jar overrides/pack.toml  overrides/index.toml

modrinth:
	@echo "Making Modrinth pack"
	packwiz modrinth export --pack-file .minecraft/pack.toml -o ../iremia-modrinth.zip
	7z d ../iremia-modrinth.zip overrides/packwiz-installer-bootstrap.jar overrides/pack.toml  overrides/index.toml

multimc:
	@echo "Making MultiMC pack"
	7z d ../iremia-multimc.zip ./* -r
	7z d ../iremia-multimc.zip ./.minecraft -r
	7z a ../iremia-multimc.zip ./* -r
	7z a ../iremia-multimc.zip ./.minecraft -r
	7z d ../iremia-multimc.zip ./.minecraft/mods ./.minecraft/pack.toml ./.minecraft/index.toml -r

clean:
	-git gc --aggressive --prune

all: curseforge modrinth multimc clean

update-packwiz:
	go install github.com/packwiz/packwiz@latest
	clear
	@echo "Packwiz has been Updated"
