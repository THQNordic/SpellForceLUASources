-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 166.081680 , 145.179031 , 81.422752 , 9.099998 , [[Camera:ScriptSplineLookAtPosition(164.207,215.840,18.000);]] )
   Camera:MotionSpline_AddSplinePoint( 166.081680 , 145.179031 , 81.422752 , 5.999997 , [[Camera:ScriptSplineLookAtPosition(164.207,215.840,18.000);]] )
   Camera:MotionSpline_AddSplinePoint( 166.081680 , 145.179031 , 81.422752 , 8.999998 , [[Camera:ScriptSplineLookAtPosition(164.207,215.840,18.000);]] )
   Camera:MotionSpline_AddSplinePoint( 166.081680 , 145.179031 , 81.422752 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(164.207,215.840,18.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
