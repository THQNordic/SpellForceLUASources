-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 273.864563 , 128.021469 , 32.166691 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(262.421,59.458,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 273.864563 , 128.021469 , 32.166691 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(262.421,59.458,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 273.864563 , 128.021469 , 32.166691 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(262.421,59.458,20.000);]] )
   Camera:MotionSpline_AddSplinePoint( 273.864563 , 128.021469 , 32.166691 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(262.421,59.458,20.000);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.976563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
