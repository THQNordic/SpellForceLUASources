-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 478.687042 , 565.158447 , 49.446194 , 29.900078 , [[Camera:ScriptSplineLookAtNpc(2497);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 470.009949 , 565.206482 , 47.180454 , 22.800051 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 452.437500 , 565.349976 , 46.776199 , 29.800077 , [[Camera:ScriptSplineLookAtPosition(465.338,565.429,80.557);
Camera:ScriptSplineLookAtApproachingModifier(0.01);]] )
   Camera:MotionSpline_AddSplinePoint( 444.405914 , 565.405884 , 45.426201 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(460.695,567.266,82.810);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 30.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
