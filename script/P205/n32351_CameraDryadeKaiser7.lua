-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 327.542145 , 392.175751 , 18.142826 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9320);]] )
   Camera:MotionSpline_AddSplinePoint( 327.542145 , 392.175751 , 18.142826 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 327.542145 , 392.175751 , 18.142826 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9250);
Camera:ScriptSplineLookAtApproachingModifier(0.05);]] )
   Camera:MotionSpline_AddSplinePoint( 327.542145 , 392.175751 , 18.142826 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
