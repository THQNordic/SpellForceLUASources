-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 587.468750 , 384.534912 , 62.209484 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3030);]] )
   Camera:MotionSpline_AddSplinePoint( 587.468750 , 384.534912 , 62.209484 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3030);]] )
   Camera:MotionSpline_AddSplinePoint( 587.468750 , 384.534912 , 62.209484 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3030);]] )
   Camera:MotionSpline_AddSplinePoint( 587.468750 , 384.534912 , 62.209484 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(3030);]] )
   
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
