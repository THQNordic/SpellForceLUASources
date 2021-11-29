-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 246.954483 , 275.989197 , 21.556042 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8787);]] )
   Camera:MotionSpline_AddSplinePoint( 244.971100 , 275.732666 , 21.556042 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 242.985199 , 275.495483 , 21.556042 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 240.999298 , 275.258301 , 21.556042 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 6.523438 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
