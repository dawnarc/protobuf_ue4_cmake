// Copyright 1998-2017 Epic Games, Inc. All Rights Reserved.

using System.IO;
using UnrealBuildTool;
using Tools.DotNETCommon;

public class MyProj : ModuleRules
{
    RulesAssembly r;

    private string ModulePath
    {
        get { return Path.GetDirectoryName(r.GetModuleFileName(this.GetType().Name).CanonicalName); }
    }

    private string ThirdPartyPath
    {
        get { return Path.GetFullPath(Path.Combine(ModulePath, "../../ThirdParty/")); }
    }

    private string ProtocBuildPath
    {
        get { return Path.GetFullPath(Path.Combine(ModulePath, "../../ThirdParty/Protobuf/Include/")); }
    }

    public MyProj(ReadOnlyTargetRules Target) : base(Target)
	{
		PCHUsage = PCHUsageMode.UseExplicitOrSharedPCHs;

		PublicDependencyModuleNames.AddRange(new string[] { "Core", "CoreUObject", "Engine", "InputCore"});

        FileReference CheckProjectFile;
        UProjectInfo.TryGetProjectForTarget("MyProj", out CheckProjectFile);
        r = RulesCompiler.CreateProjectRulesAssembly(CheckProjectFile);

        if ((Target.Platform == UnrealTargetPlatform.Win32) || (Target.Platform == UnrealTargetPlatform.Win64))
        {
            bEnableExceptions = true;
        }
        
        LoadProtobuf(Target);
    }

    public bool LoadProtobuf(ReadOnlyTargetRules Target)
    {
        PublicIncludePaths.Add(ProtocBuildPath);

        //Library path
        string PlatformString = null;
        switch (Target.Platform)
        {
            case UnrealTargetPlatform.Win64:
                {
                    PlatformString = ".lib";
                    break;
                }
            case UnrealTargetPlatform.Android:
                {
                    PlatformString = "-ndk.a";
                    break;
                }
        }

        if (null != PlatformString)
        {
            string LibrariesPath = Path.Combine(ThirdPartyPath, "Protobuf", "Library", "libprotobuf-lite" + PlatformString);
            PublicAdditionalLibraries.Add(LibrariesPath);

            string MyLibPath = Path.Combine(ThirdPartyPath, "Protobuf", "Library", "libtest" + PlatformString);
            PublicAdditionalLibraries.Add(MyLibPath);

            System.Console.WriteLine("++++++++++++ Set Protobuf Libraries: " + LibrariesPath + "\r");
        }

        //Include path
        string IncludePath = Path.Combine(ThirdPartyPath, "Protobuf", "Include");
        PublicIncludePaths.Add(IncludePath);

        System.Console.WriteLine("++++++++++++ Set Protobuf Includes: " + IncludePath + "\r");

        return true;
    }
}
