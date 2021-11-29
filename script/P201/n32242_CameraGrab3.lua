-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 290.587891 , 71.263573 , 27.251102 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(262.521,49.681,16.000);]] )
   Camera:MotionSpline_AddSplinePoint( 290.587891 , 71.263573 , 27.251102 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(262.521,49.681,16.000);]] )
   Camera:MotionSpline_AddSplinePoint( 290.587891 , 71.263573 , 27.251102 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(262.521,49.681,16.000);]] )
   Camera:MotionSpline_AddSplinePoint( 290.587891 , 71.263573 , 27.251102 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(262.521,49.681,16.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
