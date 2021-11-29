-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 531.196838 , 133.423355 , 46.772682 , 11.900009 , [[Camera:ScriptSplineLookAtPosition(496.326,154.283,28.950);]] )
   Camera:MotionSpline_AddSplinePoint( 541.263489 , 139.007401 , 46.832684 , 6.999996 , [[Camera:ScriptSplineLookAtApproachingModifier(0.02);
Camera:ScriptSplineModifyCursorSpeed(0.5);
Camera:ScriptSplineLookAtPosition(509.157,207.019,25.000);
]] )
   Camera:MotionSpline_AddSplinePoint( 551.084778 , 149.536209 , 43.302380 , 11.800009 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 554.547119 , 156.470917 , 40.122719 , 0.000000 , [[Camera:ScriptSplineModifyCursorSpeedModifier(0.3);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 12.000000 )
   Camera:MotionSpline_SetCorrection( 32.773438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
