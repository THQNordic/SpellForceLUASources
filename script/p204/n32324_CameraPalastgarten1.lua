-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 224.377594 , 476.587891 , 46.533951 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(278.080,492.211,50.000);
Camera:ScriptSplineLookAtApproachingModifier(0.04);]] )
   Camera:MotionSpline_AddSplinePoint( 225.487259 , 477.035278 , 46.533951 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9965);]] )
   Camera:MotionSpline_AddSplinePoint( 227.796417 , 476.893097 , 46.533951 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 228.641525 , 477.445465 , 47.533951 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
